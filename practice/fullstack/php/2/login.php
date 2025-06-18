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

        $sql = "SELECT * FROM `practice` WHERE username = '$username' AND password = '$password'";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            $_SESSION['username']= $username;
            echo "
            <script>
                alert('login successfull!');
            </script>";
            header("dashbaord.php");
            exit();
        } else {
            echo "
            <script>
                alert('login failed!');
            </script>  
            ";
        }
    }
    $conn->close();
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