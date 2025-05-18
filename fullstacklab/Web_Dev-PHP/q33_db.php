<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login System</title>
    <style>
        body{
            border: 5px solid black;
            padding: 20px;
            margin: 20px;
        }
    </style>
</head>
<body>
<?php
include("db_connection.php");
session_start();

// Check if logout was requested
if(isset($_GET['logout'])) {
    // Clear the session and redirect
    session_unset();
    session_destroy();
    header("Location: q33_db.php");
    exit;
}

// Check if user is already logged in
$isLoggedIn = false;
$username = "";

if(isset($_SESSION['username'])) {
    $isLoggedIn = true;
    $username = $_SESSION['username'];
}

// Process login form submission
if(isset($_POST['user']) && isset($_POST['pass'])){
    
    $username = $_POST["user"];
    $password = $_POST["pass"];

    $sql = "SELECT * FROM login WHERE username='$username' AND password='$password'";
    $result = $conn->query($sql);
    
    if($result->num_rows > 0){
        // Store in session and set flag
        $_SESSION['username'] = $username;
        $isLoggedIn = true;
    }
    else{
        echo "<p style='color: red;'>Invalid username or password!</p>";
    }
}

// Display content based on login status
if($isLoggedIn) {
    echo "<h2>Welcome $username</h2>";
    echo "<a href='q33_db.php?logout=1'>Logout</a>";
} else {
    // Show the login form only if not logged in
    ?>
    <form action="q33_db.php" method="post">
        <label for="user">Username:</label>
        <input type="text" name="user" id="user" required><br><br>
        <label for="pass">Password:</label>
        <input type="password" name="pass" id="pass" required><br><br>
        <input type="submit" value="Login"><br><br>
    </form>    <?php
}
?>

<pre>Name: Priyanshu Thapliyal  Student Id:220112794  Sem: 6th  Sec: C1</pre>
</body>
</html>