<?php


$host = 'localhost'; //  server
$user = 'root';      // username
$password = '';
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
    $password = htmlspecialchars(strip_tags($_POST['password']));

    if (!empty($username) && !empty($password)) {
        // Query to check for the user
        $sql = "SELECT * FROM users WHERE username = :username";
        $stmt = $conn->prepare($sql);

        try {
            $stmt->execute(['username' => $username]);
            $user = $stmt->fetch();

            // Verify password
            if ($user && password_verify($password, $user['password'])) {
                // Start a session and redirect to main.html
                session_start();
                $_SESSION['username'] = $username; // Store user info in session
                header('Location: main.php');
                exit(); // Ensure no further processing occurs
            } else {
                echo "<script>alert('Invalid username or password'); window.location.href='userAuthentication.html';</script>";
            }
        } catch (PDOException $e) {
            echo "<script>alert('Error: " . $e->getMessage() . "'); window.location.href='userAuthentication.html';</script>";
        }
    } else {
        echo "<script>alert('Username and password are required'); window.location.href='userAuthentication.html';</script>";
    }
}
