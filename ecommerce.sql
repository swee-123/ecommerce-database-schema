CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);


CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);


CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    stock_quantity INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);


CREATE TABLE OrderTable (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);


CREATE TABLE OrderItem (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES OrderTable(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);


CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(50),
    amount DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES OrderTable(order_id)
);


