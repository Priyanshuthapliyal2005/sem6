<?php
include("db_connection.php");
?>
<?php
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $roll=$_POST['roll'];
    $name=$_POST['name'];
    $sem=$_POST['sem'];
    $sql="insert into Student values ($roll,'$name',$sem)";
    $result=$conn->query($sql);
    if($result){
        echo "Data inserted successfully";
    }
}
?>