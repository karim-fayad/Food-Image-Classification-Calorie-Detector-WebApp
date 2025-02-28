<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['username'])) {
    // If not logged in, redirect to the login page
    header('Location: userAuthentication.html');
    exit();
}

$username = $_SESSION['username'];
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Classification</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .logout-btn {
            position: absolute;
            margin-bottom: 600px;
            top-right: 20px;
        }

        .hidden {
            display: none;
        }
    </style>
</head>

<body>
    <!-- Logout Button -->
    <form method="post" action="logout.php" class="logout-btn">
        <button type="submit" class="btn">Logout</button>
    </form>

    <div class="container">
        <div class="form-box">
            <h1>Food Classification and Calorie Detection</h1>
            <div class="form-container">
                <form id="uploadForm">
                    <label for="foodImage">Upload Food Image:</label>
                    <input type="file" id="foodImage" name="foodImage" accept="image/*" required>
                    <button type="submit" class="btn">Submit</button>
                </form>
            </div>
        </div>

        <button id="showLogsBtn" class="btn">Show My Logs</button>

        <!-- Logs Table -->
        <div id="logsContainer" class="hidden">
            <h2>Your Logs</h2>
            <table border="1" cellpadding="5" cellspacing="0">
                <thead>
                    <tr>
                        <th>Food Name</th>
                        <th>Image Path</th>
                        <th>Calories (100g)</th>
                        <th>Calories (Serving)</th>
                        <th>Carbs (100g)</th>
                        <th>Protein (100g)</th>
                        <th>Fats (100g)</th>
                        <th>Timestamp</th>
                    </tr>
                </thead>
                <tbody id="logsTableBody">
                    <!-- Rows will be populated dynamically -->
                </tbody>
            </table>
        </div>

        <div id="result" class="result-container hidden">
            <h2>Prediction Result</h2>
            <div class="result-content">
                <img id="foodImageResult" alt="Food Image" style="max-width: 300px; height: auto; border-radius: 5px;">
                <div class="nutrition-info">
                    <p id="foodName"></p>
                    <h3>Nutritional Information:</h3>
                    <p id="nutrition"></p>
                    <p id="imagePath"></p>
                </div>
            </div>
        </div>

        <div id="errorMessage" class="error hidden"></div>
    </div>

    <script>
        // Show Logs Button
        document.getElementById('showLogsBtn').addEventListener('click', async () => {
            const logsContainer = document.getElementById('logsContainer');
            const logsTableBody = document.getElementById('logsTableBody');

            if (!logsContainer.classList.contains('hidden')) {
                logsContainer.classList.add('hidden'); // Hide logs if already shown
                return;
            }

            try {
                const response = await fetch('fetch_logs.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        username: '<?php echo $username; ?>'
                    }),
                });

                if (!response.ok) {
                    throw new Error('Failed to fetch logs.');
                }

                const logs = await response.json();

                // Clear previous logs
                logsTableBody.innerHTML = '';

                // Populate table with logs
                if (logs.length > 0) {
                    logs.forEach((log) => {
                        const row = `
                            <tr>
                                <td>${log.food_name}</td>
                                <td>${log.image_path}</td>
                                <td>${log.calories_per_100g}</td>
                                <td>${log.calories_per_serving}</td>
                                <td>${log.carbs_per_100g}</td>
                                <td>${log.protein_per_100g}</td>
                                <td>${log.fats_per_100g}</td>
                                <td>${log.timestamp}</td>
                            </tr>
                        `;
                        logsTableBody.insertAdjacentHTML('beforeend', row);
                    });
                } else {
                    logsTableBody.innerHTML = '<tr><td colspan="8">No logs available.</td></tr>';
                }

                logsContainer.classList.remove('hidden'); // Show logs
            } catch (error) {
                console.error('Error fetching logs:', error);
                alert('An error occurred while fetching your logs.');
            }
        });

        // Form Submission for Image Upload
        document.getElementById('uploadForm').addEventListener('submit', async function(event) {
            event.preventDefault();

            const fileInput = document.getElementById('foodImage');
            if (fileInput.files.length === 0) {
                alert('Please upload an image.');
                return;
            }

            const formData = new FormData();
            formData.append('foodImage', fileInput.files[0]);
            formData.append('username', '<?php echo $username; ?>'); // Send username to the API

            const apiUrl = 'http://127.0.0.1:5001/';

            try {
                // Hide the form and show the result
                document.querySelector('.form-box').style.display = 'none';
                const response = await fetch(apiUrl, {
                    method: 'POST',
                    body: formData,
                });

                if (!response.ok) {
                    const errorData = await response.json();
                    document.getElementById('errorMessage').style.display = 'block';
                    document.getElementById('errorMessage').innerText = errorData.error || 'An error occurred. Please try again.';
                    document.getElementById('result').style.display = 'none';
                    return;
                }

                const data = await response.json();
                console.log('API Response:', data);

                // Show the result with the image
                document.getElementById('errorMessage').style.display = 'none';
                document.getElementById('result').classList.remove('hidden');
                document.getElementById('foodName').innerText = `Food Name: ${data.foodName}`;
                document.getElementById('nutrition').innerText = `
                    Calories (per 100g): ${data.nutrition.calories_per_100g}
                    Calories (per serving): ${data.nutrition.calories_per_serving}
                    Carbs (per 100g): ${data.nutrition.carbs_per_100g}
                    Protein (per 100g): ${data.nutrition.protein_per_100g}
                    Fats (per 100g): ${data.nutrition.fats_per_100g}
                `;
                document.getElementById('imagePath').innerText = `Uploaded Image Path: ${data.imagePath}`;

                // Display the uploaded image in the result
                const imageElement = document.getElementById('foodImageResult');
                imageElement.src = URL.createObjectURL(fileInput.files[0]);
            } catch (error) {
                console.error('Fetch error:', error);
                document.getElementById('errorMessage').classList.remove('hidden');
                document.getElementById('errorMessage').innerText = 'An unexpected error occurred. Please try again.';
                document.getElementById('result').classList.add('hidden');
            }
        });
    </script>
</body>

</html>