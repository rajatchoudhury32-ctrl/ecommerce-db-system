-- Create Database
CREATE DATABASE ecommerce;
USE ecommerce;

-- Users Table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert Sample Data
INSERT INTO users (name, email, city) VALUES
('Rajat', 'rajat@email.com', 'Bangalore'),
('Amit', 'amit@email.com', 'Delhi');

INSERT INTO products (product_name, price, stock) VALUES
('Laptop', 60000, 10),
('Phone', 20000, 20);

INSERT INTO orders (user_id, product_id, quantity, order_date) VALUES
(1, 1, 1, '2026-01-10'),
(2, 2, 2, '2026-01-12');