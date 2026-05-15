/*
Script with basic Structured Query Language (SQL) queries for data manipulation functions
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

-- Function can be found at https://www.w3schools.com/sql/sql_ref_sqlserver.asp
-- Note that functions may differ in syntax across different RDBMS


-- String functions:
    -- Query example: Convert all entries to uppercase or lowercase
    SELECT UPPER(Name) AS uppName, LOWER(Name) AS lowName
    FROM country;

    -- Query example: Find the length of each country's name
    SELECT Name, LENGTH(Name) AS nameLength
    FROM country;


-- Aggregating functions:
    -- Query example: Calculate the average population of countries
    SELECT AVG(Population) AS avgPopulation
    FROM country;   

    -- Query example: Count the number of countries in each continent
    SELECT Continent, COUNT(*) AS countryCount
    FROM country
    GROUP BY Continent;

    -- Query example: Find the maximum population of countries in each continent
    SELECT Continent, MAX(Population) AS maxPopulation
    FROM country
    GROUP BY Continent;


-- Numerical functions:
    -- Query example: Find the square root of the population of each country
    SELECT Name, SQRT(Population) AS sqrtPopulation
    FROM country;   


-- Date functions:
    -- Query example: Extract the year from a date column (assuming there is a 'IndependenceDate' column)
    SELECT from_date, 
           YEAR(from_date) AS year,
           MONTH(from_date) AS month,
           DAY(from_date) AS day,
           DATE_FORMAT(from_date, '%Y-%m-%d') AS formattedDate
    FROM dept_emp;

    -- Query example: Find the current date and time
    SELECT NOW() AS currentDateTime;


