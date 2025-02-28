<?php
$host = 'localhost'; // database server
$user = 'root'; // database username
$password = ''; // database password
$dbname = 'calorie_detect';

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $user, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Sanitize inputs
    $username = htmlspecialchars(strip_tags($_POST['username']));
    $email = htmlspecialchars(strip_tags($_POST['email']));
    $password = htmlspecialchars(strip_tags($_POST['password']));

    if (!empty($username) && !empty($email) && !empty($password)) {
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        // Insert user into the database
        $sql = "INSERT INTO users (username, email, password) VALUES (:username, :email, :password)";
        $stmt = $conn->prepare($sql);

        try {
            $stmt->execute(['username' => $username, 'email' => $email, 'password' => $hashedPassword]);

            // Start session and redirect to main.html
            session_start();
            $_SESSION['username'] = $username; // Store user info in session
            header('Location: main.php');
            exit(); //  no further processing occurs
        } catch (PDOException $e) {
            echo "<script>alert('Failed to register: " . $e->getMessage() . "'); window.location.href='userAuthentication.html';</script>";
        }
    } else {
        echo "<script>alert('All fields are required'); window.location.href='userAuthentication.html';</script>";
    }
}
