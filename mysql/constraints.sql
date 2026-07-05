-- =====================================================
-- File: constraints.sql
-- Database: ecommerce_db
-- Description: Foreign Key Constraints
-- =====================================================

USE ecommerce_db;

-- =====================================================
-- PRODUCTS
-- =====================================================

ALTER TABLE products
ADD CONSTRAINT fk_products_category
FOREIGN KEY (category_id)
REFERENCES categories(category_id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE products
ADD CONSTRAINT fk_products_supplier
FOREIGN KEY (supplier_id)
REFERENCES suppliers(supplier_id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

-- =====================================================
-- ORDERS
-- =====================================================

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

-- =====================================================
-- ORDER ITEMS
-- =====================================================

ALTER TABLE order_items
ADD CONSTRAINT fk_orderitems_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE order_items
ADD CONSTRAINT fk_orderitems_product
FOREIGN KEY (product_id)
REFERENCES products(product_id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

-- =====================================================
-- PAYMENTS
-- =====================================================

ALTER TABLE payments
ADD CONSTRAINT fk_payments_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE payments
ADD CONSTRAINT fk_payments_method
FOREIGN KEY (payment_method_id)
REFERENCES payment_methods(payment_method_id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

-- =====================================================
-- SHIPMENTS
-- =====================================================

ALTER TABLE shipments
ADD CONSTRAINT fk_shipments_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE shipments
ADD CONSTRAINT fk_shipments_provider
FOREIGN KEY (provider_id)
REFERENCES shipping_providers(provider_id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

-- =====================================================
-- RETURNS
-- =====================================================

ALTER TABLE returns
ADD CONSTRAINT fk_returns_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE returns
ADD CONSTRAINT fk_returns_product
FOREIGN KEY (product_id)
REFERENCES products(product_id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

-- =====================================================
-- INVENTORY
-- =====================================================

ALTER TABLE inventory
ADD CONSTRAINT fk_inventory_product
FOREIGN KEY (product_id)
REFERENCES products(product_id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE inventory
ADD CONSTRAINT fk_inventory_warehouse
FOREIGN KEY (warehouse_id)
REFERENCES warehouses(warehouse_id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

-- =====================================================
-- INVENTORY TRANSACTIONS
-- =====================================================

ALTER TABLE inventory_transactions
ADD CONSTRAINT fk_inventory_transactions_inventory
FOREIGN KEY (inventory_id)
REFERENCES inventory(inventory_id)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- =====================================================
-- REVIEWS
-- =====================================================

ALTER TABLE reviews
ADD CONSTRAINT fk_reviews_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE reviews
ADD CONSTRAINT fk_reviews_product
FOREIGN KEY (product_id)
REFERENCES products(product_id)
ON UPDATE CASCADE
ON DELETE CASCADE;