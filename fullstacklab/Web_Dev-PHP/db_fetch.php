<?php
include("db.php");
?>
<?php
$sql="Show tables";
$result=$conn->query($sql);
if($result){
    $res=$result->fetch_all();
    foreach($res as $row){
        echo "<br>".$row[0]."<br>";
    }
}
else{
    echo "Query unsuccessfull";
}
?>