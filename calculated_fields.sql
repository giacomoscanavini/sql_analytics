/*
Script with basic Structured Query Language (SQL) queries for calculated fields
Each query may have additional comments to explain its purpose and functionality

Since multiple popular Relational Database Management Systems (RDBMS) may have differetn syntax, 
MySQL version will be the one used here
*/


-- SELECT clause ordering:
-- 1. SELECT:   Specifies the columns to retrieve                           --> Need: YES
-- 2. FROM:     Specifies the table to retrieve data from                   --> Need: YES
-- 3. WHERE:    Filters rows based on specified conditions                  --> Need: NO (optional)
-- 4. GROUP BY: Groups rows that have the same values in specified columns  --> Need: YES (if aggregation is needed)
-- 5. HAVING:   Filters groups based on specified conditions                --> Need: NO (optional)
-- 6. ORDER BY: Sorts the result set based on specified columns             --> Need: NO (optional)


-- Query: Concatenating fields
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

SELECT Code + '-' + Name AS Code_Name
FROM country;


-- Query: Remove unwanted characters from a string
SELECT REPLACE(phone_number, '-', '') AS clean_phone_number
FROM contacts;

SELECT RTRIM(Name), LTRIM(Name), TRIM(Name)
FROM country;


-- Query: Mathematical calculations
SELECT price, quantity, price * quantity AS total_cost
FROM sales;

SELECT price, quantity, price * quantity AS total_cost
FROM sales
WHERE price > 100;


-- Query: Date calculations
SELECT order_date, delivery_date, DATEDIFF(delivery_date, order_date) AS days_to_delivery
FROM orders;


-- Query: Conditional logic with CASE statement
SELECT product_name, price,
CASE
    WHEN price < 50 THEN 'Low'
    WHEN price BETWEEN 50 AND 100 THEN 'Medium'
    ELSE 'High' 
END AS price_category
FROM products;


-- Query: Default values with COALESCE
-- COALESCE returns the first non-null value in the list (checked sequentially)
-- allowing you to provide a default value when a column contains NULL
SELECT first_name, last_name, COALESCE(email, 'No email provided') AS email
FROM customers;