<?php
// Start the session
session_start();

// Unset all session variables
$_SESSION = array();

// Destroy the session
session_destroy();

// Delete the cookie by setting expiration time in the past
setcookie('user_login', '', time() - 3600, '/');

// Redirect to login page
header("Location: login.php");
exit();
?>
