<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="db_match_user.php" method="post">
        <label for="name">Username: </label>
        <input type="text" name="username" id="name" required><br><br>
        <label for="pass">Password: </label>
        <input type="text" name="pass" id="pass" required><br><br>
        <input type="submit" value="submit"><br><br>
    </form>
</body>
</html>

<?php
include("db_connection.php");
if(isset($_POST['username']) && isset($_POST['pass'])){
    $username = $_POST['username'];
    $password = $_POST['pass'];

    // $username = $conn->real_escape_string($_POST['username']);
    // $password = $conn->real_escape_string($_POST['pass']);

    // or you can use prepare-bind-execute instead of query()
    
    $sql = "SELECT * FROM Student WHERE username='$qusername' AND password='$password'";
    $result = $conn->query($sql);
    
    if($result->num_rows > 0){
        echo "User found!";
        $res = $result->fetch_all();
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
    } else {
        echo "No user found!";
    }
}