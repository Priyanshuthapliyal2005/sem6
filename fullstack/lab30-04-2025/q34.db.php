<?php
include("db_connection.php");

$department = $_POST['department'];

// Use prepared statements to prevent SQL injection
$stmt = $conn->prepare("SELECT * FROM person WHERE dept = ?");
$stmt->bind_param("s", $department);
$stmt->execute();
$result = $stmt->get_result();

if($result){
    $res = $result->fetch_all();
    echo "<table border='1px'>
        <tr>
            <th> Id. </th>
            <th> Name. </th>
            <th> Department. </th>
        </tr>";
    foreach($res as $row){
        echo "<tr>
            <td> $row[0] </td>
            <td> $row[1] </td>
            <td> $row[2] </td>
            </tr>
            ";
    }
    echo "</table>";
}else{
    echo "no data found";
}

?>