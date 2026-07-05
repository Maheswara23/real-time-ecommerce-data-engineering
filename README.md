# 🚀 Real-Time E-Commerce Data Engineering Pipeline

> End-to-End Real-Time Data Engineering Project using Apache Kafka, MySQL, MongoDB, Databricks (Medallion Architecture), and Docker.

![GitHub](https://img.shields.io/badge/Status-In%20Progress-blue)
![Platform](https://img.shields.io/badge/Platform-Docker-blue)
![Database](https://img.shields.io/badge/Database-MySQL%20%7C%20MongoDB-orange)
![Streaming](https://img.shields.io/badge/Streaming-Apache%20Kafka-red)
![Processing](https://img.shields.io/badge/Processing-Databricks-green)
![Architecture](https://img.shields.io/badge/Architecture-Medallion-purple)

---

# 📖 Project Overview

This project demonstrates how a modern **real-time e-commerce data platform** is built using industry-standard data engineering tools and practices.

The system simulates an e-commerce platform where customer registrations, orders, payments, inventory updates, shipments, and reviews are generated as streaming events. These events are processed through a complete Medallion Architecture (Bronze → Silver → Gold) before being stored for analytics.

The project is designed to showcase practical Data Engineering concepts including:

- Database Design
- Event Streaming
- Real-Time Data Ingestion
- Data Transformation
- Data Warehousing
- Analytics
- NoSQL Data Modeling
- Enterprise Project Structure

---

# 🎯 Problem Statement

Modern e-commerce platforms generate millions of events every day.

Examples include:

- Customer Registration
- Product Updates
- Order Placement
- Payment Processing
- Inventory Changes
- Shipment Tracking
- Customer Reviews

Traditional batch ETL pipelines cannot process these events efficiently.

This project demonstrates how to build a scalable real-time data pipeline capable of ingesting, processing, transforming, and serving analytical data using modern Data Engineering technologies.

---

# 🏗️ Architecture

```
                   Customer Activity
                          │
                          ▼
              Synthetic Event Generators
                          │
                          ▼
                  Apache Kafka Topics
                          │
                          ▼
                Databricks Streaming
                          │
         ┌────────────────┼────────────────┐
         ▼                ▼                ▼
     Bronze Layer     Silver Layer     Gold Layer
 (Raw Streaming)   (Cleaned Data)   (Business KPIs)
         │                │                │
         └────────────────┼────────────────┘
                          ▼
                      MongoDB
                          │
                          ▼
                    Analytics Dashboard
```

---

# 🛠️ Technology Stack

| Category | Technology |
|----------|------------|
| Language | Python |
| Relational Database | MySQL 8 |
| NoSQL Database | MongoDB |
| Streaming Platform | Apache Kafka |
| Processing Engine | Databricks |
| Architecture | Medallion Architecture |
| Containerization | Docker |
| Version Control | Git & GitHub |
| Documentation | Markdown |

---

# 📂 Project Structure

```
Real-Time-ECommerce-Data-Engineering/
│
├── config/
│   ├── kafka_config.py
│   ├── mysql_config.py
│   └── mongodb_config.py
│
├── databricks/
│   ├── bronze/
│   ├── silver/
│   ├── gold/
│   └── shared/
│
├── docker/
│
├── kafka/
│   ├── producers/
│   ├── consumers/
│   ├── topics/
│   └── schemas/
│
├── mysql/
│   ├── schema.sql
│   ├── constraints.sql
│   ├── indexes.sql
│   ├── sample_data.sql
│   └── analytical_queries.sql
│
├── mongodb/
│
├── scripts/
│   ├── generators/
│   ├── loaders/
│   └── utils/
│
├── docs/
├── tests/
├── logs/
├── notebooks/
│
├── docker-compose.yml
├── README.md
└── LICENSE
```

---

# 🗄️ Database Design

The MySQL database contains normalized operational tables grouped into:

### Lookup Tables

- Categories
- Suppliers
- Warehouses
- Payment Methods
- Shipping Providers

### Master Tables

- Customers
- Products

### Transaction Tables

- Orders
- Order Items
- Payments
- Shipments
- Returns
- Reviews

### Operational Tables

- Inventory
- Inventory Transactions

---

# ⚡ Kafka Topics

The following Kafka topics will be used:

| Topic | Description |
|---------|-------------|
| customer_events | Customer Registration |
| product_events | Product Updates |
| order_events | Order Creation |
| payment_events | Payment Processing |
| inventory_events | Inventory Updates |
| shipment_events | Shipment Tracking |
| review_events | Product Reviews |

---

# 🥉 Bronze Layer

Stores raw streaming data exactly as received from Kafka.

Examples:

- Raw Orders
- Raw Payments
- Raw Inventory Events

No transformations are applied.

---

# 🥈 Silver Layer

Performs:

- Data Cleaning
- Deduplication
- Null Handling
- Data Validation
- Schema Standardization

---

# 🥇 Gold Layer

Contains business-ready datasets for analytics.

Examples:

- Daily Sales
- Revenue by Category
- Customer Lifetime Value
- Inventory Dashboard
- Payment Success Rate
- Return Analysis

---

# 📊 Analytics

The project supports analytical use cases such as:

- Top Selling Products
- Monthly Revenue
- Customer Segmentation
- Warehouse Inventory
- Product Ratings
- Return Rate Analysis
- Shipment Performance
- Payment Analysis

---

# 🐳 Docker Services

The project runs completely on Docker.

Containers include:

- MySQL
- MongoDB
- Apache Kafka
- Zookeeper
- Kafka UI

---

# 🚀 Current Progress

## ✅ Completed

- Project Initialization
- Git Repository Setup
- Docker Environment
- MySQL Setup
- MongoDB Setup
- Apache Kafka Setup
- Database Schema
- Foreign Key Constraints
- Performance Indexes
- Sample Data

## 🚧 In Progress

- Kafka Topic Creation
- Event Generators
- Kafka Producers
- Databricks Bronze Layer

## 📅 Planned

- Silver Layer
- Gold Layer
- MongoDB Integration
- Dashboard Development
- Performance Optimization
- Automated Testing

---

# 📈 Future Enhancements

- Apache Airflow Pipeline
- Delta Lake Optimization
- CI/CD Pipeline using GitHub Actions
- Dockerized Databricks Development
- Data Quality Validation
- Unit & Integration Testing
- Monitoring & Logging
- Kubernetes Deployment

---

# 👨‍💻 Author

**Mahesh Reddy**

Data Engineering | Machine Learning | Artificial Intelligence

GitHub: *(Add your GitHub profile here)*

LinkedIn: *(Add your LinkedIn profile here)*

---

# ⭐ Project Goal

Build a production-inspired, end-to-end real-time data engineering pipeline that demonstrates modern data engineering concepts using open-source technologies and enterprise best practices.
