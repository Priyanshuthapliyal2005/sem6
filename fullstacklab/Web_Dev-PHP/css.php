<?php
$c="blue";
$a="red"
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body{
            color:<?php echo $c ?>r
        }
    </style>
</head>
<body>
    <?php
    echo '<h1 style="color:cyan;">CSS</h1>';
    echo "hello";
    ?>
    <h1 style="color : <?php echo $a ?>">php in html</h1>
</body>
</html>