<?php

$server = "localhost";
$username = "root";
$password = "";
$database = "practical";

// First connect without database to create it
$conn = mysqli_connect($server, $username, $password);

if(!$conn){
    die("Connection failed: " . mysqli_connect_error());
}

// Create database
$query = "CREATE DATABASE IF NOT EXISTS practical";
if(mysqli_query($conn, $query)){
    // echo "Database created successfully";
} else {
    echo "Error creating database: " . mysqli_error($conn);
}

// Select the database
mysqli_select_db($conn, $database);

// Create table with proper syntax
$query = "CREATE TABLE IF NOT EXISTS practice(
    username VARCHAR(50) PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL
)";

if(mysqli_query($conn, $query)){
    // echo "Table created successfully";
} else {
    echo "Error creating table: " . mysqli_error($conn);
}

// Don't close connection here as it's needed in other files
?>
