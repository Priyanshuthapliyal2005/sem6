<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>welcome</title>
</head>
<body>
    <h1>welcome</h1>
    <?php
        if(isset($_COOKIE['user'])){
            echo "hi {$_COOKIE['user']}";  
        }
    ?>
    <a href="logout.php">Logout</a>
    <br>
</body>
</html>