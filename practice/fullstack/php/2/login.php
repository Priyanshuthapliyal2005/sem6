<?php
    session_start();
    include "conn.php";
    
    // If user is already logged in, redirect to dashboard
    if(isset($_SESSION['username'])){
        header("Location: dashboard.php");
        exit();
    }
    
    if(isset($_POST['username'])){
        $username = $_POST['username'];
        $password = $_POST['password'];

        // Use prepared statements to prevent SQL injection
        $query = "SELECT * FROM practice WHERE username = ? AND password = ?";
        $stmt = mysqli_prepare($conn, $query);
        mysqli_stmt_bind_param($stmt, "ss", $username, $password);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);

        if(mysqli_num_rows($result) > 0){
            // Start session and store username
            $_SESSION['username'] = $username;
            header("Location: dashboard.php");
            exit(); // Always exit after redirect
        }else{
            echo "Invalid username or password";
        }
        mysqli_stmt_close($stmt);
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
    <form action="login.php" method="post">
        <h1>Login</h1>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        
        <button type="submit">Login</button>
    </form>
    <a href="reset.php">
        <button> Forgot Password?</button>
    </a>
</body>
</html>