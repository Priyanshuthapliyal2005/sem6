<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=\, initial-scale=1.0">
    <title>dashboard</title>
</head>
<body>
    <?php
    session_start();
    if(!isset($_SESSION['username'])){
        header("Location: login.php");
        exit();
    }

    echo "<h1> Welcome, {$_SESSION['username']} </h1>";
    echo "<p>You are now logged in!</p>";
    echo "<p><a href='logout.php'>Logout</a></p>";
    ?>
</body>
</html>