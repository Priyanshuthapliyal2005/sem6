<?php

    session_start();
    
    // Check if cookie exists and log in user automatically
    if(!isset($_SESSION['username']) && isset($_COOKIE['user_login'])) {
        $_SESSION['username'] = $_COOKIE['user_login'];
        header("Location: welcome.php");
        exit();
    }
    
    if(isset($_POST['username'])){
        $server = "localhost";
        $username = "root";
        $password = "";
        $database = "practical"; 

        $_conn = mysqli_connect($server,$username,$password,$database);
        if(!$_conn){
            die("Connection to this database failed due to ".mysqli_connect_error());
        }

        $name = $_POST['username'];
        $user_password = $_POST['password'];

        $sql = "SELECT * FROM `practice` where `username` = '$name' and `password` = '$user_password'";
        $result = mysqli_query($_conn, $sql);
        if(mysqli_num_rows($result) > 0){
            // User exists, set session variable and cookie
            $_SESSION['username'] = $name;
            
            // Set a cookie that lasts for 30 days
            setcookie('user_login', $name, time() + (86400 * 30), "/");
            
            header("Location: welcome.php");
            exit();
        } else {
            // User does not exist, show error message
            echo "<script>alert('Invalid username or password');</script>";
        }

        mysqli_close($_conn);
    }

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
</head>
<body>
    <h1>Login Form</h1>

    <form action="login.php" method="post">
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