/*
Script with basic Structured Query Language (SQL) queries for grouping data
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


-- Quest: Grouping by one column
SELECT Continent, 
       COUNT(*) AS CountryCount,
       MIN(Population) AS MinPopulation,
       MAX(Population) AS MaxPopulation,
       AVG(Population) AS AvgPopulation
FROM country
GROUP BY Continent;


-- Quest: Grouping by multiple columns
/* Using GROUP BY with multiple columns, groups rows that share the same values in those columns
   For example, grouping by subject and year will combine rows with the same subject-year pair 
   and we can count how many students fall into each group */
SELECT Continent, Region,
       COUNT(*) AS CountryCount,
       MIN(Population) AS MinPopulation,
       MAX(Population) AS MaxPopulation,
       AVG(Population) AS AvgPopulation
FROM country
GROUP BY Continent, Region;


-- Query: Filtering with HAVING clause
/* Note that WHERE filters individual rows before grouping, while HAVING filters groups after aggregation
   The HAVING clause is used to filter groups based on aggregate conditions
   For example, we can use HAVING to find continents with an average population greater than 50 million */
SELECT Continent,
       COUNT(*) AS CountryCount,
       MIN(Population) AS MinPopulation,
       MAX(Population) AS MaxPopulation,
       AVG(Population) AS AvgPopulation
FROM country
GROUP BY Continent
HAVING AVG(Population) > 50000000;

SELECT Continent, COUNT(*) AS CountriesCount
FROM country
GROUP BY Continent
HAVING COUNT(*) > 20;


-- Query: WHERE and HAVING together
/* We can use both WHERE and HAVING in the same query to filter rows before grouping and then filter groups after aggregation
   For example, we can first filter countries with a population greater than 10 million using WHERE, 
   and then use HAVING to find continents with an average population greater than 50 million */
SELECT Continent,
       COUNT(*) AS CountryCount
FROM country
WHERE Population > 10000000
GROUP BY Continent
HAVING AVG(Population) > 50000000;


-- Query: Grouping and Sorting
/* We can use ORDER BY to sort the result set based on aggregated values
   For example, we can group countries by continent and then sort the continents by the number of countries in descending order */
SELECT Continent, COUNT(*) AS CountriesCount
FROM country
GROUP BY Continent
ORDER BY CountriesCount DESC;


-- Query: Partitioning with PARTITION BY and OVER
-- A very nice review of PARTITIN BY can be found here: https://www.sqlshack.com/sql-partition-by-clause-overview/
-- PARTITION BY differs from GROUP BY in that it does not reduce the number of rows returned; 
-- instead, it allows us to perform calculations across partitions while still returning individual rows
/* The PARTITION BY clause is used in window functions to divide the result set into partitions and perform calculations across those partitions
   For example, we can calculate the total population for each continent and then 
   calculate the percentage of each country's population relative to its continent's total */
SELECT Name, Continent, Population,
       SUM(Population) OVER (PARTITION BY Continent) AS ContinentPopulation,
       (Population / SUM(Population) OVER (PARTITION BY Continent)) * 100 AS PopulationPercentage
FROM country;


-- Query: Partitioning with PARTITION BY and ROW_NUMBER()
/* The ROW_NUMBER() function assigns a unique sequential integer to rows within a partition of a result set, 
   starting at 1 for the first row in each partition
   For example, we can use ROW_NUMBER() to assign a rank to countries within each continent based on their population */
SELECT Name, Continent, Population,
       ROW_NUMBER() OVER (PARTITION BY Continent ORDER BY Population DESC) AS PopulationRank
FROM country;

