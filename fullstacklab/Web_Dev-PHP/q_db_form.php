<!-- Design an html form used to insert some data into the database -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="q33_db_insert.php" method="post">
        <label for="roll">Roll no.: </label>
        <input type="number" name="roll" id="roll" required><br><br>
        <label for="name">Name: </label>
        <input type="text" name="name" id="name" required><br><br>
        <label for="sem">Sem: </label>
        <input type="number" name="sem" id="sem" required><br><br>
        <input type="submit" value="submit"><br><br>
    </form>
</body>
</html>
