<?php
include 'connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST["name"];
    $roll_no = $_POST["roll_no"];
    $subject = $_POST["subject"];

    $sql = "INSERT INTO attendance (name, roll_no, subject) VALUES ('$name', '$roll_no', '$subject')";
    // $result = mysqli_query($conn, $sql);
    $result = $conn->query($sql);
    if ($result) {
        echo "<p> Record inserted successfully!</p>";
    } else {
        echo "<p> Record insertion failed!</p>";
    }
}