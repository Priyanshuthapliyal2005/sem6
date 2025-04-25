//wap to dispaly some records from the data in tabular form     
<?php
include 'connection.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendace Tracker</title>
</head>
<body>
    <a href="display.php">Display</a>
</body>
</html>

<?php

$sql = "select * from attendance";
$result = $conn->query($sql);

if($result){
    $res = $result->fetch_all();
    echo "<table border=1px>.
    <tr>
    <th>name</th>
    <th>roll_no</th>
    <th>subject</th>
    <th>username</th>
    <th>password</th>
    </tr>";
    foreach($res as $row){
        echo "<tr>
        <td>{$row[0]}</td>
        <td>{$row[1]}</td>
        <td>{$row[2]}</td>
        <td>{$row[3]}</td>
        <td>{$row[4]}</td>
        </tr>";
    }
    echo "</table>";
}
$conn ->close();
?>