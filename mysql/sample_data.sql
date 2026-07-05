-- =====================================================
-- File        : sample_data.sql
-- Database    : ecommerce_db
-- Description : Seed Data for Lookup Tables
-- =====================================================

USE ecommerce_db;

INSERT INTO categories (category_name, description) VALUES
('Electronics','Electronic gadgets and devices'),
('Computers','Laptops, desktops and accessories'),
('Mobile Phones','Smartphones and accessories'),
('Home Appliances','Appliances for home use'),
('Fashion','Clothing and accessories'),
('Footwear','Shoes and sandals'),
('Beauty','Beauty and personal care'),
('Books','Books and magazines'),
('Sports','Sports equipment'),
('Fitness','Fitness accessories'),
('Furniture','Home and office furniture'),
('Kitchen','Kitchen essentials'),
('Groceries','Daily grocery items'),
('Toys','Kids toys'),
('Automotive','Vehicle accessories'),
('Gaming','Gaming consoles and accessories'),
('Pet Supplies','Products for pets'),
('Jewelry','Jewelry and watches'),
('Health','Healthcare products'),
('Office Supplies','Office essentials');

INSERT INTO payment_methods(method_name,description)
VALUES
('Credit Card','Visa Mastercard'),
('Debit Card','Bank Debit Cards'),
('UPI','Unified Payments Interface'),
('Net Banking','Internet Banking'),
('PayPal','PayPal Gateway'),
('Wallet','Digital Wallet'),
('Cash on Delivery','COD'),
('Gift Card','Gift Voucher');

INSERT INTO shipping_providers
(provider_name,contact_number,website)
VALUES
('Blue Dart','18002092333','https://www.bluedart.com'),
('DTDC','18001234567','https://www.dtdc.in'),
('Delhivery','18001023333','https://www.delhivery.com'),
('Ekart','18002089898','https://www.ekartlogistics.com'),
('India Post','18002666868','https://www.indiapost.gov.in'),
('FedEx','18004194343','https://www.fedex.com'),
('DHL','1800111345','https://www.dhl.com'),
('XpressBees','18004191212','https://www.xpressbees.com');

INSERT INTO warehouses
(
warehouse_name,
city,
state,
country,
capacity
)
VALUES
('Hyderabad Warehouse','Hyderabad','Telangana','India',50000),
('Bangalore Warehouse','Bangalore','Karnataka','India',70000),
('Chennai Warehouse','Chennai','Tamil Nadu','India',45000),
('Mumbai Warehouse','Mumbai','Maharashtra','India',90000),
('Delhi Warehouse','New Delhi','Delhi','India',85000),
('Pune Warehouse','Pune','Maharashtra','India',40000),
('Kolkata Warehouse','Kolkata','West Bengal','India',50000),
('Ahmedabad Warehouse','Ahmedabad','Gujarat','India',35000),
('Lucknow Warehouse','Lucknow','Uttar Pradesh','India',30000),
('Jaipur Warehouse','Jaipur','Rajasthan','India',30000);

INSERT INTO suppliers
(
supplier_name,
contact_person,
email,
phone,
city,
state,
country
)
VALUES
('Samsung India','Rahul Sharma','contact@samsung.com','9876543210','Noida','Uttar Pradesh','India'),
('Apple India','Ankit Verma','sales@apple.com','9876543211','Bangalore','Karnataka','India'),
('Sony India','Priya Nair','info@sony.com','9876543212','Mumbai','Maharashtra','India'),
('Dell India','Amit Kumar','sales@dell.com','9876543213','Hyderabad','Telangana','India'),
('HP India','Neha Singh','support@hp.com','9876543214','Chennai','Tamil Nadu','India'),
('Boat Lifestyle','Rohit Gupta','info@boat.com','9876543215','Delhi','Delhi','India'),
('Lenovo India','Sneha Rao','sales@lenovo.com','9876543216','Bangalore','Karnataka','India'),
('LG Electronics','Arjun Patel','contact@lg.com','9876543217','Pune','Maharashtra','India'),
('Nike India','Karan Mehta','sales@nike.com','9876543218','Mumbai','Maharashtra','India'),
('Adidas India','Divya Reddy','sales@adidas.com','9876543219','Hyderabad','Telangana','India');
