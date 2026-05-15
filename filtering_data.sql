/*
Script with basic Structured Query Language (SQL) queries to filter data
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


-- Query: Checking for matches
SELECT Name, Population 
FROM country
WHERE Continent = 'Asia';


-- Query: Checking for non-matches
SELECT Name, Population
FROM country
WHERE Continent <> 'Asia';


-- Query: Checking for a range of values
SELECT Name, Population
FROM country
WHERE Population BETWEEN 1000000 AND 5000000;


-- Query: Checking for NULL values
SELECT Name, Population
FROM country
WHERE Population IS NULL;

SELECT Name, Population
FROM country
WHERE Population IS NOT NULL;


-- Use of operators
-- Query: Using AND operator to combine conditions
SELECT Name, Population
FROM country
WHERE Continent = 'Asia' AND Population > 1000000;

-- Query: Using OR operator to combine conditions
SELECT Name, Population
FROM country
WHERE Continent = 'Asia' OR Population > 1000000;

-- Query: Using AND and OR operators together with parentheses to control the order of evaluation
SELECT Name, Population
FROM country
WHERE (Continent = 'Asia' OR Continent = 'Europe') AND 
      Population > 1000000 AND
      Population < 5000000;       

-- Query: Using IN operator to check for multiple matches
SELECT Name, Population
FROM country
WHERE Continent IN ('Asia', 'Europe');

-- Query: Using NOT IN operator to check for non-matches
SELECT Code, Name
FROM country
WHERE Code NOT IN ('USA', 'CAN', 'MEX');


-- Use of LIKE operator and wildecards
-- Query: % wildcard to match any sequence of characters
SELECT Name, Population
FROM country
WHERE Name LIKE 'A%';   -- Matches names starting with 'A'
WHERE Name LIKE '%a';   -- Matches names ending with 'a'
WHERE Name LIKE '%an%'; -- Matches names containing 'an'

-- Query: _ wildcard to match a single character
-- The number of _ wildcards indicates the precise number of characters to match
SELECT Name, Population
FROM country
WHERE Name LIKE 'A_';   -- Matches names with 'A' followed by any single character
WHERE Name LIKE '_a';   -- Matches names with any single character followed by 'a'
WHERE Name LIKE '_a_';  -- Matches names with any single character followed by 'a' followed by any single character
WHERE Name LIKE 'A__';  -- Matches names with 'A' followed by any two characters

-- Query: Using NOT LIKE operator to find non-matches
SELECT Name, Population
FROM country
WHERE Name NOT LIKE 'A%';   -- Matches names that do not start with 'A'
WHERE Name NOT LIKE '%a';   -- Matches names that do not end with 'a'
WHERE Name NOT LIKE '%an%'; -- Matches names that do not contain 'an'