<?php
$servername = "localhost";
$username = "root";
$password ="";
$database ="sem6";

$conn = mysqli_connect($servername, $username, $password, $database);


if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
?>