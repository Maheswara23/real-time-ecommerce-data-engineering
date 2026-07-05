-- =====================================================
-- Database  : ecommerce_db
-- Author    : Mahesh Reddy
-- Project   : Real-Time E-Commerce Data Engineering
-- Description: Database schema for operational data
-- =====================================================

USE ecommerce_db;

-- ===========================
-- LOOKUP TABLES IN DATABASE 
-- ===========================

-- CATEGORY  TABLE 

CREATE TABLE IF NOT EXISTS categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);

-- SUPPLIERS TABLE 

CREATE TABLE IF NOT EXISTS suppliers (
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

CREATE TABLE IF NOT EXISTS warehouses (
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

CREATE TABLE IF NOT EXISTS payment_methods (
    payment_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255)
);

-- SHIPPING PROVIDERS 

CREATE TABLE IF NOT EXISTS shipping_providers (
    provider_id INT AUTO_INCREMENT PRIMARY KEY,
    provider_name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(20),
    website VARCHAR(255)
);

-- ===========================
-- MASTER TABLES IN DATABASE 
-- ===========================

-- CUSTOMERS TABLE 

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20),
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    street_address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    customer_status ENUM('Active','Inactive') DEFAULT 'Active',
    loyalty_points INT DEFAULT 0,
    is_prime_member BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);

-- PRODUCTS TABLE 

CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(200) NOT NULL,
    category_id INT NOT NULL,
    supplier_id INT NOT NULL,
    sku VARCHAR(50) NOT NULL UNIQUE,
    brand VARCHAR(100),
    unit_price DECIMAL(10,2) NOT NULL,
    cost_price DECIMAL(10,2),
    weight DECIMAL(8,2),
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    rating DECIMAL(2,1),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);

-- =================================
-- TRANSACTION TABLES IN DATABASE 
-- =================================

-- ORDERS TABLE 

CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    order_status ENUM(
        'Pending',
        'Confirmed',
        'Processing',
        'Shipped',
        'Delivered',
        'Cancelled',
        'Returned'
    ) DEFAULT 'Pending',

    total_amount DECIMAL(10,2) NOT NULL,
    shipping_address VARCHAR(255),
    billing_address VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);

-- ORDER ITEMS TABLE 

CREATE TABLE IF NOT EXISTS order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,

    order_id INT NOT NULL,

    product_id INT NOT NULL,

    quantity INT NOT NULL,

    unit_price DECIMAL(10,2) NOT NULL,

    discount DECIMAL(10,2) DEFAULT 0,

    subtotal DECIMAL(10,2) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);

-- PAYMENTS TABLE 

CREATE TABLE IF NOT EXISTS payments (

    payment_id INT AUTO_INCREMENT PRIMARY KEY,

    order_id INT NOT NULL,

    payment_method_id INT NOT NULL,

    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    amount DECIMAL(10,2) NOT NULL,

    payment_status ENUM(
        'Pending',
        'Success',
        'Failed',
        'Refunded'
    ) DEFAULT 'Pending',

    transaction_reference VARCHAR(100),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);

-- SHIPMENTS TABLE

CREATE TABLE IF NOT EXISTS shipments (

    shipment_id INT AUTO_INCREMENT PRIMARY KEY,

    order_id INT NOT NULL,

    provider_id INT NOT NULL,

    tracking_number VARCHAR(100),

    shipment_status ENUM(
        'Pending',
        'Packed',
        'Dispatched',
        'In Transit',
        'Delivered'
    ) DEFAULT 'Pending',

    shipped_date TIMESTAMP NULL,

    estimated_delivery_date DATE,

    delivered_date TIMESTAMP NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);

-- RETURNS TABLE 

CREATE TABLE IF NOT EXISTS returns (

    return_id INT AUTO_INCREMENT PRIMARY KEY,

    order_id INT NOT NULL,

    product_id INT NOT NULL,

    return_reason VARCHAR(255),

    return_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    refund_amount DECIMAL(10,2),

    return_status ENUM(
        'Requested',
        'Approved',
        'Rejected',
        'Completed'
    ) DEFAULT 'Requested',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);

-- ================================
-- OPERATIONAL TABLES IN DATABASE 
-- ================================

-- INVENTORY TABLE 

CREATE TABLE IF NOT EXISTS inventory (

    inventory_id INT AUTO_INCREMENT PRIMARY KEY,

    product_id INT NOT NULL,

    warehouse_id INT NOT NULL,

    quantity_in_stock INT NOT NULL DEFAULT 0,

    reorder_level INT DEFAULT 10,

    last_stock_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP

);

-- INVENTORY TRANSACTIONS TABLE 

CREATE TABLE IF NOT EXISTS inventory_transactions (

    transaction_id INT AUTO_INCREMENT PRIMARY KEY,

    inventory_id INT NOT NULL,

    transaction_type ENUM(
        'PURCHASE',
        'SALE',
        'RETURN',
        'ADJUSTMENT'
    ) NOT NULL,

    quantity_changed INT NOT NULL,

    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    remarks VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- REVIEWS TABLE 

CREATE TABLE reviews (

review_id INT AUTO_INCREMENT PRIMARY KEY,

customer_id INT,

product_id INT,

rating INT,

review_title VARCHAR(100),

review_text TEXT,

review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);
