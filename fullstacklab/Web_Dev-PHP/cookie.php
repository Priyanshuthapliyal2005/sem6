
<?php
$name="aman";
setcookie('username',$name); // set cookie
echo "cookie is set : ".$_COOKIE['username']; // retrieve cookie
setcookie('username','',time()-3600); //delete cookie
?>