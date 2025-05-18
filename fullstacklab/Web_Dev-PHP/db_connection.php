<?php
$hostname= "localhost";
$username= "root";
$password="";
$dbname="gehu";
$conn =new mysqli($hostname,$username, $password, $dbname);
if($conn->connect_error){
    die("connection unsuccessfull".$conn->connect_error);
}
?>