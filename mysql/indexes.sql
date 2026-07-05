-- =====================================================
-- File        : indexes.sql
-- Database    : ecommerce_db
-- Description : Performance Indexes
-- =====================================================

USE ecommerce_db;

-- =====================================================
-- CUSTOMERS
-- =====================================================

CREATE INDEX idx_customers_email
ON customers(email);

CREATE INDEX idx_customers_city
ON customers(city);

CREATE INDEX idx_customers_state
ON customers(state);

CREATE INDEX idx_customers_status
ON customers(customer_status);

-- =====================================================
-- PRODUCTS
-- =====================================================

CREATE INDEX idx_products_category
ON products(category_id);

CREATE INDEX idx_products_supplier
ON products(supplier_id);

CREATE INDEX idx_products_brand
ON products(brand);

CREATE INDEX idx_products_sku
ON products(sku);

CREATE INDEX idx_products_active
ON products(is_active);

-- =====================================================
-- ORDERS
-- =====================================================

CREATE INDEX idx_orders_customer
ON orders(customer_id);

CREATE INDEX idx_orders_date
ON orders(order_date);

CREATE INDEX idx_orders_status
ON orders(order_status);

CREATE INDEX idx_orders_customer_date
ON orders(customer_id, order_date);

-- =====================================================
-- ORDER ITEMS
-- =====================================================

CREATE INDEX idx_order_items_order
ON order_items(order_id);

CREATE INDEX idx_order_items_product
ON order_items(product_id);

CREATE INDEX idx_order_items_order_product
ON order_items(order_id, product_id);

-- =====================================================
-- PAYMENTS
-- =====================================================

CREATE INDEX idx_payments_order
ON payments(order_id);

CREATE INDEX idx_payments_status
ON payments(payment_status);

CREATE INDEX idx_payments_date
ON payments(payment_date);

-- =====================================================
-- SHIPMENTS
-- =====================================================

CREATE INDEX idx_shipments_order
ON shipments(order_id);

CREATE INDEX idx_shipments_provider
ON shipments(provider_id);

CREATE INDEX idx_shipments_status
ON shipments(shipment_status);

-- =====================================================
-- RETURNS
-- =====================================================

CREATE INDEX idx_returns_order
ON returns(order_id);

CREATE INDEX idx_returns_product
ON returns(product_id);

CREATE INDEX idx_returns_status
ON returns(return_status);

-- =====================================================
-- INVENTORY
-- =====================================================

CREATE INDEX idx_inventory_product
ON inventory(product_id);

CREATE INDEX idx_inventory_warehouse
ON inventory(warehouse_id);

CREATE INDEX idx_inventory_product_warehouse
ON inventory(product_id, warehouse_id);

-- =====================================================
-- INVENTORY TRANSACTIONS
-- =====================================================

CREATE INDEX idx_inventory_transactions_inventory
ON inventory_transactions(inventory_id);

CREATE INDEX idx_inventory_transactions_date
ON inventory_transactions(transaction_date);

CREATE INDEX idx_inventory_transactions_type
ON inventory_transactions(transaction_type);

-- =====================================================
-- REVIEWS
-- =====================================================

CREATE INDEX idx_reviews_customer
ON reviews(customer_id);

CREATE INDEX idx_reviews_product
ON reviews(product_id);

CREATE INDEX idx_reviews_rating
ON reviews(rating);
