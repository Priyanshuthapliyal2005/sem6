<?php
$insert = false;
    if(isset($_POST['name'])){
        $server = "localhost";
        $username = "root";
        $password ="";
        $database = "trip";
        $conn = mysqli_connect($server,$username,$password,$database);

        if(!$conn){
            die("connection to this database failed due to ".mysqli_connect_error());
        }
        $name=$_POST['name'];
        $email=$_POST['email'];
        $phone=$_POST['phone'];
        $address=$_POST['address'];
        $gender=$_POST['gender'];
        $description=$_POST['description'];

        //  echo "Connection to this database was successful.<br>";
        $sql = "INSERT INTO `trip`(`name`, `email`, `phone`, `address`, `gender`, `description`) VALUES ('$name','$email','$phone','$address','$gender','$description')";
        // echo $sql;

        if($conn -> query($sql) == TRUE){
            // echo "Successfully inserted";
            $insert =true;
        }else{
            $insert = false;
            echo "Error: $sql  <br> $conn->error";
        }

        $conn->close();
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WElcome to travel form </title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class = "container">
        <h1>welcome to travel form to us</h1>
        <p>enter ur details in below form.</p>        <?php
        if($insert === true){
            echo '<p class = "submitMSG">Thanks for submitting the form. We are happy to see you joining with us.</p>';
        }
        ?>
        
        <form action="index.php" method="post">
            <input type="text" name="name" id="name" placeholder="Enter your name" required>
            <input type="email" name="email" id="email" placeholder="Enter your email" required>
            <input type="number" name="phone" id="phone" placeholder="Enter your phone number" required>
            <input type="text" name="address" id="address" placeholder="Enter your address" required>
            <input type="text" name="gender" id="gender" placeholder="Enter your gender" required>
            <textarea name="description" id="description" cols="30" rows="10" placeholder="Enter your description" required></textarea>            <BUTTON class="btn" type="submit">Submit</BUTTON>
            <BUTTON class="btn" type="reset">Reset</BUTTON>
        </form>
    </div>

    <script src="script.js"></script>
</body>
</html>
