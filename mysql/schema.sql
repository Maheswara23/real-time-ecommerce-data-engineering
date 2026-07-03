-- =====================================================
-- Database  : ecommerce_db
-- Author    : Mahesh Reddy
-- Project   : Real-Time E-Commerce Data Engineering
-- Description: Database schema for operational data
-- =====================================================

CREATE DATABASE ecommerce_db;

USE ecommerce_db;

-- ===========================
-- MASTER TABLES IN DATABASE 
-- ===========================

-- CATEGORY  TABLE 

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);

-- SUPPLIERS TABLE 

CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(150) NOT NULL,
    contact_person VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);

-- WAREHOUSES TABLE 

CREATE TABLE warehouses (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    capacity INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);

-- PAYMENT METHODS

CREATE TABLE payment_methods (
    payment_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255)
);

-- SHIPPING PROVIDERS 

CREATE TABLE shipping_providers (
    provider_id INT AUTO_INCREMENT PRIMARY KEY,
    provider_name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(20),
    website VARCHAR(255)
);