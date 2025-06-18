<?php
    session_start();
    
    // Check if user is logged in
    if(!isset($_SESSION['username'])){
        header("Location: login.php");
        exit();
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
</head>
<body>
    <?php
        echo "<h1>Welcome to the Dashboard! {$_SESSION['username']} </h1>";
    ?>
    <a href="logout.php">
        <button>Logout</button>
    </a>
</body>
</html>