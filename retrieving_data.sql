/*
Script with basic Structured Query Language (SQL) queries to retrieve data
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


-- Query: Retrieve individual columns from a table
SELECT Name
FROM country;


-- Query: Retrieve multiple columns from a table
SELECT Name, Continent, Population
FROM country;


-- Query: Retrieve all columns from a table
SELECT *
FROM country;


-- Query: Retrieve distinct rows from a table
SELECT DISTINCT Continent
FROM country;


-- Query: Retrieve rows but limit the number of results
SELECT Name, Population
FROM country
LIMIT 10; -- Skip 0 rows and return the first 10 rows

SELECT Name, Population
FROM country
LIMIT 5 OFFSET 10; -- Skip the first 10 rows and return the next 5 rows