<?php
    // Unset the cookie by setting its expiration time to the past
    if(isset($_COOKIE['user'])) {
        setcookie('user', ''); // Expire the cookie
    }
    
    // Redirect to the login page
    header("Location: cookie.php");
    exit(); // Stop script execution after redirect
?>