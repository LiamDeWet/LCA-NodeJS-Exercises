CREATE DATABASE IF NOT EXISTS techvibe_db;

-- select the database to use
USE techvibe_db;

-- the products table
CREATE TABLE IF NOT EXISTS products(
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  category VARCHAR(100) NOT NULL
);

-- employees table
CREATE TABLE IF NOT EXISTS employees(
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  department VARCHAR(100) NOT NULL
);

