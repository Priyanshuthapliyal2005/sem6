<?php
include("db_connection.php");

$sql="select * from Student";
$result=$conn->query($sql);
if($result){
    $res=$result->fetch_all();
    echo "<table border='1px'>
            <tr>
                <th>Roll no.</th>
                <th>Name</th>
                <th>Sem</th>
            </tr>";
    foreach($res as $row){
        echo "<tr>
                <td>".$row[0]."</td>
                <td>".$row[1]."</td>
                <td>".$row[2]."</td>
            </tr>";
    }
    echo "</table>";
}
else{
    echo "No records found";
}
$conn->close();
?>