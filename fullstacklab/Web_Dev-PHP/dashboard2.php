<?php
session_start();
?>
<?php
if(isset($_SESSION['username'])){
    echo "Welcome ".$_SESSION['username'];
}
?>
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
    <br><br><a href="logout.php">Log Out</a>
    <pre>Name: Priyanshu Thapliyal  Student Id:220112794  Sem: 6th  Sec: C1</pre>
</body>
</html>