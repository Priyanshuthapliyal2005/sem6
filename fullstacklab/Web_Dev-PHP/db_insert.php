<?php
include("db.php");
?>
<?php
$sql="insert into Student values (1, 'Priyanshu', 6)";
$result=$conn->query($sql);
if($result){
    echo "Data inserted successfully";
}
?>