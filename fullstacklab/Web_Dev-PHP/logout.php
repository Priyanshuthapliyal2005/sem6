<?php
session_start();
session_unset();
session_destroy();
header("Location:q32_session.php");
exit;
?>