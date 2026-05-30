/* CALCULATED FIELDS */
/* concatenating fields for strings 
    literally joins the content of the rows in to a new column */
SELECT CONCAT(firstName, ' ', lastName) AS fullName
SELECT CONCAT(firstName, '-', lastName) AS fullName
FROM Employees

/* conditional clauses with CASE WHEN */
SELECT 
    customer_name,
    total_spend,
    CASE
        WHEN total_spend >= 1000 THEN 'high'
        WHEN total_spend >= 500 THEN 'medium'
        ELSE 'low'
    END AS customer_type
FROM Customers;

/* default values with COALESCE 
    COALESCE is particularly useful to handle missing values (NULL) 
    since mathematical operations with NULL return a NULL value */
SELECT 
    product_name
    COALESCE(discount, 0) AS discount_value
FROM Products;

SELECT 
    price
    COALESCE(discount, 0) AS discount,
    print - COALESCE(discount, 0) AS final_price
FROM Products;

SELECT 
    firstName, 
    lastName,
    COALESCE(phone_mobile, phone_home, phone_work, 'No phone') -- The first non-NULL expression is returned
FROM Employees;