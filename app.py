import os
from flask import Flask, request, jsonify
import tensorflow as tf
from flask_cors import CORS
from PIL import Image
import numpy as np
from werkzeug.utils import secure_filename
import mysql.connector
import datetime

app = Flask(__name__)
CORS(app)

# Ensure the uploads folder exists
UPLOAD_FOLDER = 'uploads'
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# Load trained model
model = tf.keras.models.load_model('food_classifier_model.h5')
model.compile(optimizer='adam', loss='categorical_crossentropy', metrics=['accuracy'])

# Food labels corresponding to the model classes
food_names = [
    'Apple pie', 'Baby back ribs', 'Baklava', 'Beef carpaccio', 'Beef tartare', 'Beet salad', 'Beignets',
    'Bibimbap', 'Bread pudding', 'Breakfast burrito', 'Bruschetta', 'Caesar salad', 'Cannoli', 'Caprese salad',
    'Carrot cake', 'Ceviche', 'Cheesecake', 'Cheese plate', 'Chicken curry', 'Chicken quesadilla', 'Chicken wings',
    'Chocolate cake', 'Chocolate mousse', 'Churros', 'Clam chowder', 'Club sandwich', 'Crab cakes', 'Creme brulee',
    'Croque madame', 'Cup cakes', 'Deviled eggs', 'Donuts', 'Dumplings', 'Edamame', 'Eggs benedict', 'Escargots',
    'Falafel', 'Filet mignon', 'Fish and chips', 'Foie gras', 'French fries', 'French onion soup', 'French toast',
    'Fried calamari', 'Fried rice', 'Frozen yogurt', 'Garlic bread', 'Gnocchi', 'Greek salad', 'Grilled cheese sandwich',
    'Grilled salmon', 'Guacamole', 'Gyoza', 'Hamburger', 'Hot and sour soup', 'Hot dog', 'Huevos rancheros', 'Hummus',
    'Ice cream', 'Lasagna', 'Lobster bisque', 'Lobster roll sandwich', 'Macaroni and cheese', 'Macarons', 'Miso soup',
    'Mussels', 'Nachos', 'Omelette', 'Onion rings', 'Oysters', 'Pad thai', 'Paella', 'Pancakes', 'Panna cotta',
    'Peking duck', 'Pho', 'Pizza', 'Pork chop', 'Poutine', 'Prime rib', 'Pulled pork sandwich', 'Ramen', 'Ravioli',
    'Red velvet cake', 'Risotto', 'Samosa', 'Sashimi', 'Scallops', 'Seaweed salad', 'Shrimp and grits',
    'Spaghetti bolognese', 'Spaghetti carbonara', 'Spring rolls', 'Steak', 'Strawberry shortcake', 'Sushi', 'Tacos',
    'Takoyaki', 'Tiramisu', 'Tuna tartare', 'Waffles'
]

# Database connection function
def get_nutrition_from_db(food_name):
    db_config = {
        'host': 'localhost',
        'user': 'root',
        'password': '',
        'database': 'calorie_detect'
    }

    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()

    query = """
        SELECT calories_per_100g, calories_per_serving, carbs_per_100g, protein_per_100g, fats_per_100g
        FROM food_calories 
        WHERE food_name = %s
    """
    cursor.execute(query, (food_name,))
    result = cursor.fetchone()
    cursor.close()
    conn.close()

    if result:
        return {
            'calories_per_100g': result[0],
            'calories_per_serving': result[1],
            'carbs_per_100g': result[2],
            'protein_per_100g': result[3],
            'fats_per_100g': result[4],
        }
    else:
        return None

# Function to save the log of each upload
def save_log(username, food_name, image_path, nutrition):
    db_config = {
        'host': 'localhost',
        'user': 'root',
        'password': '',
        'database': 'calorie_detect'
    }

    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()

    query = """
        INSERT INTO logs (username, food_name, image_path, calories_per_100g, calories_per_serving, 
        carbs_per_100g, protein_per_100g, fats_per_100g, timestamp)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
    """
    timestamp = datetime.datetime.now()

    cursor.execute(query, (
        username, food_name, image_path, nutrition['calories_per_100g'], nutrition['calories_per_serving'],
        nutrition['carbs_per_100g'], nutrition['protein_per_100g'], nutrition['fats_per_100g'], timestamp))

    conn.commit()
    cursor.close()
    conn.close()

@app.route('/', methods=['GET', 'POST'])
def upload_image():
    if request.method == 'GET':
        return "Welcome to the Food Classification API. Use POST to upload an image.", 200

    if 'foodImage' not in request.files:
        return jsonify({'error': 'No image uploaded'}), 400

    image_file = request.files['foodImage']
    username = request.form.get('username')
    if not username:
        return jsonify({'error': 'Username is required'}), 400

    filename = secure_filename(image_file.filename)
    image_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
    image_file.save(image_path)

    # Preprocess the image using the updated method
    img = Image.open(image_path)
    img = img.resize((224, 224))
    img_array = np.array(img)
    if img_array.ndim == 2:  # Check if grayscale
        img_array = np.stack([img_array] * 3, axis=-1)
    img_array = img_array.astype('float32') / 255.0
    img_array = np.expand_dims(img_array, axis=0)

    # Predict food class
    predictions = model.predict(img_array)
    predicted_class = np.argmax(predictions)
    food_name = food_names[predicted_class]

    # Get nutritional info from database
    nutrition = get_nutrition_from_db(food_name)
    if nutrition is None:
        return jsonify({'error': 'Nutrition data not available for this food item.'}), 404

    # Save the log
    save_log(username, food_name, image_path, nutrition)

    return jsonify({
        'foodName': food_name,
        'nutrition': nutrition,
        'imagePath': image_path
    }), 200

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5001)
