<style>
    body{
        border: 5px solid black;
        padding: 20px;
        margin: 20px;
    }
</style>
<?php
include("db_connection.php");
$department=$_POST["department"];
$sql = "select * from person where department = $department"; 
$result=$conn->query($sql);
if($result){
    $res = $result->fetch_all();
    echo "<table border='1px'>
            <tr>
                <th>Id.</th>
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
    echo "No data found.";
}
?>
<pre>Name: Priyanshu Thapliyal  Student Id:220112794  Sem: 6th  Sec: C1</pre>
