-- Create the gehu database if it doesn't exist
CREATE DATABASE IF NOT EXISTS gehu;

-- Use the gehu database
USE gehu;

-- Create the login table if it doesn't exist
CREATE TABLE IF NOT EXISTS login (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);

-- Insert a sample user for testing
INSERT INTO login (username, password) VALUES ('Priyanshu', '123');
INSERT INTO login (username, password) VALUES ('admin', 'admin');
