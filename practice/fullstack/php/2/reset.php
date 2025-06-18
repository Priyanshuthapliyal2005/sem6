<?php
    include "conn.php";

    if(isset($_POST['username'])){
        $username = $_POST['username'];
        $email = $_POST['email'];
        $password = $_POST['password'];

        $sql = "SELECT * FROM practice WHERE username = '$username' AND email = '$email'";
        $result = mysqli_query($conn, $sql);
        if(mysqli_num_rows($result) > 0){
            $sql = "UPDATE practice SET password = '$password' where username = '$username' AND email = '$email'";
            $result = mysqli_query($conn, $sql);
            if($result){
                echo "Password reset successfully.";
            } else {
                echo "Error resetting password: " . mysqli_error($conn);
            }
        } else {
            echo "Invalid username or email.";
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
</head>
<body>
    <form action="reset.php" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>
        <label for="password">New Password:</label>
        <input type="password" id="password" name="password" required>
        <button type="submit">Reset Password</button>
    </form>
</body>
</html>