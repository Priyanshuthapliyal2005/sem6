<?php
// Include config file
// Make sure config.php is in the same directory or provide the correct path
require_once "config.php";

// If user is already logged in, redirect to welcome page
if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
    header("location: welcome.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <p>Please fill in your credentials to login.</p>
    <?php
    // Display errors if redirected back from login_process.php
    if(!empty($_SESSION["login_err"])){
        echo '<div style="color: red;">' . $_SESSION["login_err"] . '</div>';
        unset($_SESSION["login_err"]); // Clear the error after displaying
    }
    ?>
    <form action="login_process.php" method="post">
        <div>
            <label>Username</label>
            <input type="text" name="username" required>
        </div>
        <div>
            <label>Password</label>
            <input type="password" name="password" required>
        </div>
        <div>
            <input type="submit" value="Login">
        </div>
        <p>Don't have an account? <a href="signup.php">Sign up now</a>.</p>
    </form>
</body>
</html>
