<!-- Q33. Create a login form with fields for User ID and Password. Upon form submission, validate the entered credentials by matching them with existing records. If the User ID and Password are correct, display a new welcome page. -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body{
            border: 5px solid black;
            padding: 20px;
            margin: 20px;
        }
    </style>
</head>
<body>
    <form action="q33_db.php" method="post">
        <label for="user">Username</label>
        <input name="user" id="user" type="text" required><br><br>
        <label for="pass">Password</label>
        <input name="pass" id="pass" type="password" required><br><br>
        <input type="submit" value="Login"><br><br>
    </form>
</body>
</html>