<?php
include "config.php";

if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] == "true"){
    header("location:welcome.php");
    exit;
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
</head>
<body>

<p>Please fill this form to create an account</p>
<form action="signup_process.php" method="post">
    <div>
        <label >Username</label>
        <input type="text" name="username" required>
    </div>

    <div>
        <label>Password</label>
        <input type="password" name="password" required>
    </div>

    <div>
        <input type="submit" value="submit">
        <input type="reset" value="reset">
    </div>
    <p>already have an account? <a href="login.php">login</a></p>
</form>
</body>
</html>