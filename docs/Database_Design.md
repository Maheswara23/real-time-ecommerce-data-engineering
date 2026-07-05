# 🗄️ Database Design

## Overview

The **E-Commerce Operational Database** is designed using a normalized relational model to support transactional workloads (OLTP) while serving as the source system for the real-time data engineering pipeline.

The database stores customer, product, order, payment, shipment, inventory, and review data that will later be streamed into Apache Kafka and processed using the Medallion Architecture in Databricks.

---

# Database Information

| Property | Value |
|----------|-------|
| Database Name | ecommerce_db |
| Database Type | MySQL 8 |
| Design | Normalized (3NF) |
| Purpose | OLTP System |
| Total Tables | 14 |
| Primary Keys | Auto Increment |
| Foreign Keys | Implemented |
| Indexes | Optimized for Query Performance |

---

# Database Structure

The database is divided into four logical layers.

## 1. Lookup Tables

These tables contain relatively static reference data.

| Table | Description |
|--------|-------------|
| categories | Product Categories |
| suppliers | Supplier Information |
| warehouses | Warehouse Details |
| payment_methods | Supported Payment Methods |
| shipping_providers | Logistics Providers |

---

## 2. Master Tables

These tables store core business entities.

| Table | Description |
|--------|-------------|
| customers | Customer Information |
| products | Product Catalog |

---

## 3. Transaction Tables

These tables store business transactions.

| Table | Description |
|--------|-------------|
| orders | Customer Orders |
| order_items | Products within an Order |
| payments | Payment Details |
| shipments | Shipment Tracking |
| returns | Product Returns |
| reviews | Customer Product Reviews |

---

## 4. Operational Tables

These tables support inventory operations.

| Table | Description |
|--------|-------------|
| inventory | Current Product Stock |
| inventory_transactions | Inventory Movement History |

---

# Entity Relationship Overview

```
Customers
     │
     │
     ▼
 Orders
     │
     ▼
Order Items
     │
     ▼
 Products
     │
 ┌───┴──────────────┐
 ▼                  ▼
Categories      Suppliers
```

```
Orders
 │
 ├────────► Payments
 │
 ├────────► Shipments
 │
 └────────► Returns
```

```
Products
 │
 ├────────► Inventory
 │               │
 │               ▼
 │     Inventory Transactions
 │
 └────────► Reviews
```

---

# Database Files

| File | Purpose |
|------|---------|
| schema.sql | Creates all database tables |
| constraints.sql | Adds all foreign key constraints |
| indexes.sql | Creates indexes for performance optimization |
| sample_data.sql | Inserts lookup and reference data |
| analytical_queries.sql | Business SQL queries (planned) |

---

# Relationships

The database uses foreign keys to maintain referential integrity.

Examples include:

- Products → Categories
- Products → Suppliers
- Orders → Customers
- Order Items → Orders
- Order Items → Products
- Payments → Orders
- Shipments → Orders
- Inventory → Products
- Inventory → Warehouses
- Reviews → Customers
- Reviews → Products

---

# Indexing Strategy

Indexes have been created on frequently queried columns to improve query performance.

Examples include:

- Customer Email
- Product SKU
- Category ID
- Supplier ID
- Order Date
- Order Status
- Payment Status
- Shipment Status
- Product ID
- Warehouse ID

Composite indexes are also added for common analytical queries.

---

# Data Flow

```
Synthetic Data Generator
          │
          ▼
     Apache Kafka
          │
          ▼
      MySQL Database
          │
          ▼
 Databricks Bronze Layer
          │
          ▼
 Databricks Silver Layer
          │
          ▼
 Databricks Gold Layer
          │
          ▼
       MongoDB
          │
          ▼
 Business Dashboards
```

---

# Database Design Principles

The schema follows standard relational database design principles.

- Third Normal Form (3NF)
- Primary Key Constraints
- Foreign Key Constraints
- Data Integrity
- Query Performance Optimization
- Scalable Table Structure
- Business-Oriented Data Model

---

# Future Enhancements

The following improvements are planned as the project evolves:

- Stored Procedures
- Triggers
- Views
- Materialized Summary Tables
- Partitioning
- Audit Tables
- Slowly Changing Dimensions (SCD)
- Change Data Capture (CDC)

---

# Status

| Component | Status |
|----------|--------|
| Schema Design | ✅ Completed |
| Foreign Keys | ✅ Completed |
| Indexes | ✅ Completed |
| Seed Data | ✅ Completed |
| ER Diagram | ⏳ Planned |
| Analytical Queries | ⏳ Planned |
| Views | ⏳ Planned |
| Stored Procedures | ⏳ Planned |

---

## Author

**Mahesh Reddy**

**Project:** Real-Time E-Commerce Data Engineering Pipeline
