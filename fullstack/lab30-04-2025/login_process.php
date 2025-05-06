<?php
// Include config file
// Make sure config.php is in the same directory or provide the correct path
require_once "config.php";

// Define variables and initialize with empty values
$username = $password = "";
$username_err = $password_err = $login_err = "";

// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){

    // Check if username is empty
    if(empty(trim($_POST["username"]))){
        $username_err = "Please enter username.";
    } else{
        $username = trim($_POST["username"]);
    }

    // Check if password is empty
    if(empty(trim($_POST["password"]))){
        $password_err = "Please enter your password.";
    } else{
        $password = trim($_POST["password"]);
    }

    // Validate credentials
    if(empty($username_err) && empty($password_err)){
        // Prepare a select statement
        $sql = "SELECT id, username, password FROM users WHERE username = ?";

        if($stmt = $mysqli->prepare($sql)){
            // Bind variables to the prepared statement as parameters
            $stmt->bind_param("s", $param_username);

            // Set parameters
            $param_username = $username;

            // Attempt to execute the prepared statement
            if($stmt->execute()){
                // Store result
                $stmt->store_result();

                // Check if username exists, if yes then verify password
                if($stmt->num_rows == 1){
                    // Bind result variables
                    $stmt->bind_result($id, $username_db, $stored_password);
                    if($stmt->fetch()){
                        // Compare plain text passwords directly (INSECURE!)
                        if($password === $stored_password){
                            // Password is correct, so start a new session (already started in config.php)

                            // Store data in session variables
                            $_SESSION["loggedin"] = true;
                            $_SESSION["id"] = $id;
                            $_SESSION["username"] = $username_db;

                            // Redirect user to welcome page
                            header("location: welcome.php");
                            exit;
                        } else{
                            // Password is not valid
                            $login_err = "Invalid username or password.";
                        }
                    }
                } else{
                    // Username doesn't exist
                    $login_err = "Invalid username or password.";
                }
            } else{
                // Store error message in session to display on index.php
                $_SESSION["login_err"] = "Oops! Something went wrong. Please try again later.";
                header("location: index.php");
                exit;
            }

            // Close statement
            $stmt->close();
        }
    }

    // Close connection
    $mysqli->close();

    // If there were errors, store the main error in session and redirect back to index.php
    if(!empty($login_err)) {
        $_SESSION["login_err"] = $login_err;
    } elseif (!empty($username_err)) {
         $_SESSION["login_err"] = $username_err; // Or combine errors if needed
    } elseif (!empty($password_err)) {
         $_SESSION["login_err"] = $password_err;
    }

    if (!empty($_SESSION["login_err"])) {
        header("location: index.php");
        exit;
    }

} else {
     // If not a POST request, redirect to login page
    header("location: index.php");
    exit;
}
?>
