<!-- design an html form used to insert some data into the database -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendace Tracker</title>
</head>
<body>
    <form action="insert.php" method="post">
        <label for="name">name:</label>
        <input type="text" name="name" id="name" required><br><br>
        <label for="roll_no">roll no:</label>
        <input type="number" name="roll_no" id="roll_no" required><br><br>
        <label for="subject">subject:</label>
        <input type="text" name="subject" id="subject" required><br><br>
        <input type="submit" value="submit">
    </form>
</body>
</html>