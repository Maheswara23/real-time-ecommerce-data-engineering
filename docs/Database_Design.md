# Database Design

## Overview

The e-commerce platform uses MySQL as its relational database to store structured operational data.

The schema is designed using Third Normal Form (3NF) to minimize redundancy, improve data consistency, and support analytical queries.

The database contains master, transactional, and operational tables.

---

# Database Name

```sql
ecommerce_db
```

---

# Database Layers

## Master Tables

These tables store relatively static business information.

| Table | Description |
|---------|------------|
| customers | Customer information |
| categories | Product categories |
| suppliers | Supplier details |
| products | Product catalog |
| warehouses | Warehouse information |
| payment_methods | Supported payment methods |
| shipping_providers | Courier companies |

---

## Transaction Tables

These tables store business transactions.

| Table | Description |
|---------|------------|
| orders | Customer orders |
| order_items | Products purchased |
| payments | Payment records |
| shipments | Shipping records |
| returns | Returned products |

---

## Operational Tables

These tables support inventory management.

| Table | Description |
|---------|------------|
| inventory | Current stock |
| inventory_transactions | Stock movement history |

---

# Relationships

Customers
→ Orders

Orders
→ Order Items

Products
→ Order Items

Products
→ Categories

Products
→ Suppliers

Products
→ Inventory

Warehouses
→ Inventory

Orders
→ Payments

Orders
→ Shipments

Orders
→ Returns

Payments
→ Payment Methods

Shipments
→ Shipping Providers

---

# Normalization

The schema follows Third Normal Form (3NF).

Benefits:

- Eliminates redundant data
- Ensures referential integrity
- Simplifies maintenance
- Supports scalable analytics

---

# Naming Conventions

Primary Keys

customer_id

product_id

order_id

Foreign Keys

customer_id

product_id

supplier_id

Date Columns

created_at

updated_at

Status Columns

order_status

payment_status

shipment_status

---

# Future Extensions

The schema can be extended to support:

- Coupons
- Promotions
- Loyalty Programs
- Multiple Sellers
- Fraud Detection
- Product Recommendations