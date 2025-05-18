<?php
include "db_connection.php";

// Create table if it doesn't exist
$create_table = "CREATE TABLE IF NOT EXISTS user_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL
)";

if ($conn->query($create_table) === FALSE) {
    echo "Error creating table: " . $conn->error;
}

// Process form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check if all fields are filled
    if (!empty($_POST['name']) && !empty($_POST['email']) && !empty($_POST['phone'])) {
        $name = $_POST['name'];
        $email = $_POST['email'];
        $phone = $_POST['phone'];
        
        // Insert data into database
        $sql = "INSERT INTO user_info (name, email, phone) VALUES ('$name', '$email', '$phone')";
        
        if ($conn->query($sql) === TRUE) {
            echo "<div style='color: green; font-weight: bold;'>Record created successfully!</div>";
            echo "<div>Name: $name <br>Email: $email <br>Phone: $phone</div>";
        } else {
            echo "<div style='color: red; font-weight: bold;'>Error: " . $conn->error . "</div>";
        }
    } else {
        echo "<div style='color: red; font-weight: bold;'>Please fill in all fields.</div>";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration Form</title>
    <style>
        body{
            border: 5px solid black;
            padding: 20px;
            margin: 20px;
        }
    </style>
</head>
<body>
    <h2>User Registration Form</h2>
    <form action="q30_form.php" method="post">
        <label for="name">Name: </label>
        <input type="text" name="name" id="name" required><br><br>
        <label for="email">Email: </label>
        <input type="email" name="email" id="email" required><br><br>
        <label for="phone">Phone no.:  </label>
        <input type="number" name="phone" id="phone" required><br><br>
        <input type="submit" value="Submit"><br><br>
    </form>
    <pre>Name: Priyanshu Thapliyal  Student Id:220112794  Sem: 6th  Sec: C1</pre>
</body>
</html>