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
    <form action="q32_session.php" method="post">
        <label for="">username</label>
        <input type="text" name="user" required> <br><br>
        <label for="">Password</label>
        <input type="password" name="pass" required> <br><br>
        <input type="submit" value="submit"> <br><br>
    </form>
    <pre>Name: Priyanshu Thapliyal  Student Id:220112794  Sem: 6th  Sec: C1</pre>
</body>
</html>
<?php
$db_u="Priyanshu";
$db_p="123";
if(isset($_POST['user'])){
    $u=$_POST['user'];
    $p=$_POST['pass'];
    if(($db_u==$u) && ($db_p==$p)){
        session_start();
        $_SESSION['username']=$u;
        header("Location:dashboard2.php");
    }
    else{
        echo "Invalid password or username";
    }
}
?>