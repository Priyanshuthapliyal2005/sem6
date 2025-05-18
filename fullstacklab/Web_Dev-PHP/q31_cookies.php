<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body{
            border: 5px solid black;
            padding: 20px;
            margin: 20px;
        }
    </style>
</head>
<body>
    <form action="q31_cookies.php" method="post">
        <label for="name">Name: </label>
        <input type="text" name="name" id="name"><br><br>
        <button name="set" value="set">Set cookie</button><br><br>
        <button name="get" value="get">Show cookie</button><br><br>
        <button name="delete" value="delete">Delete cookie</button><br><br>
    </form>
    <pre>Name: Priyanshu Thapliyal  Student Id:220112794  Sem: 6th  Sec: C1</pre>
</body>
</html>

<?php
if(($_SERVER['REQUEST_METHOD'] == 'POST') && isset($_POST['name'])){
    if(isset($_POST['set'])){
        if(!empty($_POST['name'])){
            $name = $_POST['name'];
            setcookie('username', $name); 
            echo "Cookie is set.";
        } else {
            echo "Please enter a name to set the cookie.";
            exit;
        }
    }
    elseif(isset($_POST['get'])){
        if(isset($_COOKIE['username'])){
            echo "Cookie value: " . $_COOKIE['username'];
        } else {
            echo "Cookie is not set.";
        }
    }
    elseif(isset($_POST['delete'])){
        setcookie('username', '', time() - 3600); 
        echo "Cookie is deleted.";
    }
}
?>