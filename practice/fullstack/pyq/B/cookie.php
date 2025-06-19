<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HardCoded Login</title>
</head>
<body>
    <h1>HardCoded Login</h1>
    <form action="cookie.php" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        <br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <br><br>
        <button type="submit">Login</button>
    </form>
</body>
</html>

<?php
    if(isset($_COOKIE['user'])){
        // If the cookie is set, redirect to welcome page
        header("Location: welcome.php");
        exit();
    }

    if(isset($_POST['username']) && isset($_POST['password'])){
        $username = $_POST['username'];
        $password = $_POST['password'];

        // Hardcoded credentials
        $valid_username = "admin";
        $valid_password = "password123";

        if($username === $valid_username && $password === $valid_password){
            setcookie("user",$username,time() + 1000 * 60 *60); 
            // Set a cookie for 1 hour
            header("Location: welcome.php");
            exit();
        } else {
            echo "<script>alert('Invalid username or password');</script>";
        }
    }
?>