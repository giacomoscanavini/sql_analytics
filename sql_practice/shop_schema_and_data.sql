BEGIN TRANSACTION;
CREATE TABLE customers (
        customer_id INTEGER PRIMARY KEY,
        first_name TEXT NOT NULL,
        last_name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        city TEXT,
        country TEXT NOT NULL,
        signup_date TEXT NOT NULL
    );
INSERT INTO "customers" VALUES(1,'Alice','Rossi','alice@example.com','Milan','Italy','2025-01-05');
INSERT INTO "customers" VALUES(2,'Ben','Smith','ben@example.com','London','UK','2025-01-10');
INSERT INTO "customers" VALUES(3,'Chika','Tanaka','chika@example.com','Tokyo','Japan','2025-02-12');
INSERT INTO "customers" VALUES(4,'Daniel','Muller','daniel@example.com','Berlin','Germany','2025-02-20');
INSERT INTO "customers" VALUES(5,'Elena','Garcia','elena@example.com','Madrid','Spain','2025-03-03');
INSERT INTO "customers" VALUES(6,'Fatima','Khan','fatima@example.com','Dubai','UAE','2025-03-18');
INSERT INTO "customers" VALUES(7,'Giacomo','Bianchi','giacomo@example.com','Bologna','Italy','2025-04-02');
INSERT INTO "customers" VALUES(8,'Hana','Kim','hana@example.com','Seoul','South Korea','2025-04-09');
INSERT INTO "customers" VALUES(9,'Ivan','Petrov','ivan@example.com','Sofia','Bulgaria','2025-04-15');
INSERT INTO "customers" VALUES(10,'Julia','Nowak','julia@example.com','Warsaw','Poland','2025-04-20');
INSERT INTO "customers" VALUES(11,'Kenji','Suzuki','kenji@example.com','Osaka','Japan','2025-05-01');
INSERT INTO "customers" VALUES(12,'Laura','Rossi','laura@example.com',NULL,'Italy','2025-05-03');
INSERT INTO "customers" VALUES(13,'Mark','Smith','mark@example.com','Manchester','UK','2025-05-05');
INSERT INTO "customers" VALUES(14,'Nora','Olsen','nora@example.com','Oslo','Norway','2025-05-08');
INSERT INTO "customers" VALUES(15,'Owen','Taylor','owen@example.com','Dublin','Ireland','2025-05-09');
INSERT INTO "customers" VALUES(16,'Priya','Sharma','priya@example.com','Mumbai','India','2025-05-11');
INSERT INTO "customers" VALUES(17,'Quentin','Martin','quentin@example.com','Paris','France','2025-05-13');
INSERT INTO "customers" VALUES(18,'Rina','Ito','rina@example.com','Kyoto','Japan','2025-05-15');
CREATE TABLE order_items (
        order_item_id INTEGER PRIMARY KEY,
        order_id INTEGER NOT NULL,
        product_id INTEGER NOT NULL,
        quantity INTEGER NOT NULL CHECK (quantity > 0),
        unit_price REAL NOT NULL CHECK (unit_price >= 0),
        FOREIGN KEY (order_id) REFERENCES orders(order_id),
        FOREIGN KEY (product_id) REFERENCES products(product_id)
    );
INSERT INTO "order_items" VALUES(1,1,1,1,34.9);
INSERT INTO "order_items" VALUES(2,1,4,3,4.5);
INSERT INTO "order_items" VALUES(3,2,2,1,89.5);
INSERT INTO "order_items" VALUES(4,2,3,2,49.99);
INSERT INTO "order_items" VALUES(5,3,7,1,149.99);
INSERT INTO "order_items" VALUES(6,4,8,1,219.0);
INSERT INTO "order_items" VALUES(7,5,6,2,27.75);
INSERT INTO "order_items" VALUES(8,5,5,1,18.0);
INSERT INTO "order_items" VALUES(9,6,3,1,49.99);
INSERT INTO "order_items" VALUES(10,6,4,5,4.5);
INSERT INTO "order_items" VALUES(11,7,7,1,149.99);
INSERT INTO "order_items" VALUES(12,8,8,1,219.0);
INSERT INTO "order_items" VALUES(13,8,2,1,89.5);
INSERT INTO "order_items" VALUES(14,9,5,2,18.0);
INSERT INTO "order_items" VALUES(15,10,3,3,49.99);
INSERT INTO "order_items" VALUES(16,10,1,1,34.9);
INSERT INTO "order_items" VALUES(17,11,6,1,27.75);
INSERT INTO "order_items" VALUES(18,11,4,2,4.5);
INSERT INTO "order_items" VALUES(19,12,2,1,89.5);
INSERT INTO "order_items" VALUES(20,13,9,1,24.99);
INSERT INTO "order_items" VALUES(21,14,10,1,59.9);
INSERT INTO "order_items" VALUES(22,14,11,1,0.0);
INSERT INTO "order_items" VALUES(23,15,12,1,399.0);
INSERT INTO "order_items" VALUES(24,16,14,4,12.0);
INSERT INTO "order_items" VALUES(25,16,13,1,9.99);
INSERT INTO "order_items" VALUES(26,17,15,2,35.0);
INSERT INTO "order_items" VALUES(27,18,16,1,180.0);
INSERT INTO "order_items" VALUES(28,18,5,1,18.0);
INSERT INTO "order_items" VALUES(29,19,2,1,89.5);
INSERT INTO "order_items" VALUES(30,19,3,1,49.99);
INSERT INTO "order_items" VALUES(31,20,12,1,399.0);
INSERT INTO "order_items" VALUES(32,21,7,1,149.99);
INSERT INTO "order_items" VALUES(33,21,9,2,24.99);
INSERT INTO "order_items" VALUES(34,22,17,1,50.0);
INSERT INTO "order_items" VALUES(35,23,11,3,0.0);
INSERT INTO "order_items" VALUES(36,24,8,1,219.0);
INSERT INTO "order_items" VALUES(37,25,1,1,34.9);
INSERT INTO "order_items" VALUES(38,25,6,1,27.75);
INSERT INTO "order_items" VALUES(39,26,10,1,59.9);
INSERT INTO "order_items" VALUES(40,26,14,2,12.0);
CREATE TABLE orders (
        order_id INTEGER PRIMARY KEY,
        customer_id INTEGER NOT NULL,
        order_date TEXT NOT NULL,
        status TEXT NOT NULL CHECK (
            status IN ('pending', 'paid', 'shipped', 'cancelled', 'refunded')
        ),
        promo_code TEXT,
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    );
INSERT INTO "orders" VALUES(1,1,'2025-04-10','paid',NULL);
INSERT INTO "orders" VALUES(2,2,'2025-04-11','shipped','WELCOME10');
INSERT INTO "orders" VALUES(3,3,'2025-04-12','paid',NULL);
INSERT INTO "orders" VALUES(4,1,'2025-04-15','cancelled',NULL);
INSERT INTO "orders" VALUES(5,4,'2025-04-18','shipped',NULL);
INSERT INTO "orders" VALUES(6,5,'2025-04-21','paid','SPRING');
INSERT INTO "orders" VALUES(7,6,'2025-04-22','refunded',NULL);
INSERT INTO "orders" VALUES(8,7,'2025-04-25','shipped',NULL);
INSERT INTO "orders" VALUES(9,8,'2025-04-27','paid',NULL);
INSERT INTO "orders" VALUES(10,3,'2025-05-01','shipped','SPRING');
INSERT INTO "orders" VALUES(11,5,'2025-05-04','paid',NULL);
INSERT INTO "orders" VALUES(12,2,'2025-05-06','cancelled',NULL);
INSERT INTO "orders" VALUES(13,9,'2025-05-07','pending',NULL);
INSERT INTO "orders" VALUES(14,10,'2025-05-08','paid','WELCOME10');
INSERT INTO "orders" VALUES(15,11,'2025-05-09','shipped',NULL);
INSERT INTO "orders" VALUES(16,12,'2025-05-10','paid',NULL);
INSERT INTO "orders" VALUES(17,13,'2025-05-11','refunded','SPRING');
INSERT INTO "orders" VALUES(18,14,'2025-05-12','shipped',NULL);
INSERT INTO "orders" VALUES(19,3,'2025-05-13','paid',NULL);
INSERT INTO "orders" VALUES(20,15,'2025-05-14','cancelled',NULL);
INSERT INTO "orders" VALUES(21,16,'2025-05-15','paid','VIP');
INSERT INTO "orders" VALUES(22,17,'2025-05-16','shipped',NULL);
INSERT INTO "orders" VALUES(23,18,'2025-05-17','paid',NULL);
INSERT INTO "orders" VALUES(24,5,'2025-05-18','pending','VIP');
INSERT INTO "orders" VALUES(25,1,'2025-05-19','shipped',NULL);
INSERT INTO "orders" VALUES(26,10,'2025-05-20','paid',NULL);
CREATE TABLE products (
        product_id INTEGER PRIMARY KEY,
        product_name TEXT NOT NULL,
        category TEXT NOT NULL,
        unit_price REAL NOT NULL CHECK (unit_price >= 0),
        discontinued INTEGER NOT NULL DEFAULT 0 CHECK (discontinued IN (0, 1))
    );
INSERT INTO "products" VALUES(1,'Laptop Stand','Office',34.9,0);
INSERT INTO "products" VALUES(2,'Mechanical Keyboard','Electronics',89.5,0);
INSERT INTO "products" VALUES(3,'USB-C Hub','Electronics',49.99,0);
INSERT INTO "products" VALUES(4,'Notebook','Office',4.5,0);
INSERT INTO "products" VALUES(5,'Water Bottle','Lifestyle',18.0,0);
INSERT INTO "products" VALUES(6,'Desk Lamp','Home',27.75,0);
INSERT INTO "products" VALUES(7,'Noise-Cancelling Headphones','Electronics',149.99,0);
INSERT INTO "products" VALUES(8,'Ergonomic Chair','Home',219.0,0);
INSERT INTO "products" VALUES(9,'Wireless Mouse','Electronics',24.99,0);
INSERT INTO "products" VALUES(10,'Monitor Arm','Office',59.9,0);
INSERT INTO "products" VALUES(11,'Coffee Mug','Lifestyle',0.0,0);
INSERT INTO "products" VALUES(12,'Standing Desk','Home',399.0,0);
INSERT INTO "products" VALUES(13,'Old Phone Charger','Electronics',9.99,1);
INSERT INTO "products" VALUES(14,'Planner','Office',12.0,0);
INSERT INTO "products" VALUES(15,'Yoga Mat','Lifestyle',35.0,0);
INSERT INTO "products" VALUES(16,'Air Purifier','Home',180.0,0);
INSERT INTO "products" VALUES(17,'Gift Card','Gift',50.0,0);
INSERT INTO "products" VALUES(18,'Obsolete Cable','Electronics',3.99,1);
COMMIT;
