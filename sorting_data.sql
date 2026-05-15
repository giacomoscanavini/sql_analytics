/*
Script with basic Structured Query Language (SQL) queries to sorting data
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


-- Query: Sorting by one column
SELECT Name
FROM country
ORDER BY Name ASC;  -- Sorts the result in ascending order (A-Z)
ORDER BY Name DESC; -- Sorts the result in descending order (Z-A)
ORDER BY Code ASC;  -- Sorts the result by the 'Code' column in ascending order


-- Query: Sorting by multiple columns
SELECT Name, Population
FROM country
ORDER BY Population DESC, Name ASC;  -- Sorts first by Population in descending order, then by Name in ascending order for ties in Population


-- Query: Sorting with NULL values
SELECT Name, Population
FROM country
ORDER BY Population ASC;  -- NULL values will appear first in ascending order
ORDER BY Population DESC; -- NULL values will appear last in descending order


-- Query: Sorting by column position
SELECT Name, Population, Code
FROM country
ORDER BY 3 DESC, 1 ASC;  -- Sorts the result by the third column (Code) in descending order, then by the first column (Name) in ascending order


-- Query: Sorting with CASE statement
SELECT Name, Population,
       CASE
           WHEN Population > 1000000 THEN 'High'
           WHEN Population > 500000 THEN 'Medium'
           ELSE 'Low'
       END AS PopulationCategory
FROM country
ORDER BY PopulationCategory ASC;  -- Sorts the result by the 'PopulationCategory' in ascending order (Low, Medium, High)


-- Query: Sorting with aggregate functions
SELECT Continent, COUNT(*) AS CountryCount
FROM country
GROUP BY Continent
ORDER BY CountryCount DESC;  -- Sorts the result by the count of countries in each continent in descending order