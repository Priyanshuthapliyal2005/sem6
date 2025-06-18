<?php
    session_start();
    // If user is already logged in, redirect to dashboard
    if(isset($_SESSION['username'])){
        header("Location: dashboard.php");
        exit();
    }
    if(isset($_POST['username'])){
        include 'conn.php';

        $username = $_POST['username'];
        $email = $_POST['email'];
        $password = $_POST['password'];
        $confirm_password = $_POST['confirm_password'];
        $phone = $_POST['phone'];


        if($password === $confirm_password){
            $sql = "INSERT INTO `practice`(`username`,`email`,`password`,`phone`) VALUES ('$username','$email','$password','$phone')";

            if($conn -> query($sql) === TRUE){
                echo "New record created successfully";
                // Redirect to login page after successful signup
                header("login.php");
            } else {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }
    }
        else {
            echo "Passwords do not match.";
        }



        $conn->close();

    }
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SignUp</title>
</head>
<body>
    <form action="signup.php" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>

        <label for="confirm_password">Confirm Password:</label>
        <input type="password" id="confirm_password" name="confirm_password" required><br><br>
        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" required><br><br>

        <button type="submit">Submit</button>
        <button type="reset">Reset</button>
        <p>Already have an account? <a href="login.php">Login here</a></p>
    </form>
</body>
</html>