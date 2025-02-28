<?php
header('Content-Type: application/json');
session_start();

if (!isset($_SESSION['username'])) {
    echo json_encode([]);
    exit();
}

$username = $_SESSION['username'];

// Database connection
$db_host = 'localhost';
$db_user = 'root';
$db_password = '';
$db_name = 'calorie_detect';

$conn = new mysqli($db_host, $db_user, $db_password, $db_name);

if ($conn->connect_error) {
    echo json_encode([]);
    exit();
}

$query = "SELECT food_name, image_path, calories_per_100g, calories_per_serving, carbs_per_100g, protein_per_100g, fats_per_100g, timestamp FROM logs WHERE username = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param('s', $username);
$stmt->execute();
$result = $stmt->get_result();
$user_logs = $result->fetch_all(MYSQLI_ASSOC);

$stmt->close();
$conn->close();

echo json_encode($user_logs);
