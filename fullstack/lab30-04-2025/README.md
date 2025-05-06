# Simple PHP Auth Mini-Project (Plain Text Passwords - TESTING ONLY)

A basic PHP and MySQL project demonstrating user signup, login, and logout functionality.

**WARNING:** This version stores passwords in plain text in the database. This is **EXTREMELY INSECURE** and should **NEVER** be used for any real application. It is intended for basic testing and learning purposes only.

## Setup Instructions

1.  **Database Setup:**
    *   Ensure you have XAMPP installed and Apache/MySQL servers running.
    *   Open phpMyAdmin (usually `http://localhost/phpmyadmin`).
    *   Create a new database named `auth_db`. If it already exists, you might want to drop it first for a clean setup.
    *   Select the `auth_db` database and go to the SQL tab.
    *   Copy the content of `database.sql` (provided in this folder) and execute it to create the `users` table.

2.  **Configuration:**
    *   Make sure all the project files (`config.php`, `index.php`, `login_process.php`, `logout.php`, `signup.php`, `signup_process.php`, `welcome.php`) are inside the `D:\3year\sem6\fullstack\lab30-04-2025` directory.
    *   Verify the database credentials in `config.php` match your MySQL setup (default XAMPP is usually user 'root' with no password, connecting to 'localhost', database 'auth_db').

3.  **Running the Project:**
    *   Place the entire `lab30-04-2025` folder inside your XAMPP `htdocs` directory (e.g., `C:\xampp\htdocs\lab30-04-2025`).
    *   Open your web browser and navigate to the project directory, e.g., `http://localhost/lab30-04-2025/`.
    *   You should see the login page (`index.php`).
    *   You can sign up for a new account via the link or `http://localhost/lab30-04-2025/signup.php`.
    *   After signup or login, you will be redirected to `welcome.php`.
    *   Use the logout link on the welcome page to end the session.
