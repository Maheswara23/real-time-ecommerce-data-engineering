BOOTSTRAP_SERVERS = "localhost:9092"

TOPICS = {
    "customers": "customer_events",
    "products": "product_events",
    "orders": "order_events",
    "payments": "payment_events",
    "inventory": "inventory_events",
    "shipments": "shipment_events",
    "reviews": "review_events"
}

PARTITIONS = 3

REPLICATION_FACTOR = 1