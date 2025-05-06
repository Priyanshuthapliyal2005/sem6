-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS auth_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Use the created database
USE auth_db;

-- Drop the table if it already exists (optional, for clean setup)
DROP TABLE IF EXISTS users;

-- Create the users table
CREATE TABLE users (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL, -- Storing plain text, but keep VARCHAR(255) for potential future hashing
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
