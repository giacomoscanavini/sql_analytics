/* GROUPING DATA */
/* The use of GROUP BY is meant to aggregate rows based on some common column value 
    The total rows are actually reduced to the unique values of the groups 
    This also means that an aggregating function must be used to condense the information 
    provided by the aggregated rows, examples are SUM(), AVG(), MIN(), MAX(), COUNT() */

/* group by one column */
SELECT
    continent, 
    MIN(population) AS min_population,
    MAX(population) AS max_population,
    AVG(population) AS avg_population
FROM Country
GROUP BY continent;


/* group by multiple columns */
SELECT 
    continent, 
    region,
    MIN(population) AS min_population,
    MAX(population) AS max_population,
    AVG(population) AS avg_population
FROM Country
GROUP BY continent, region;
/* every individual column called in the SELECT statement must be present in the GROUP BY clause */


/* filtering groups with HAVING */
SELECT 
    continent,
    region,
    count(*) AS num_countries,
    MIN(population) AS min_population,
    MAX(population) AS max_population,
    AVG(population) AS avg_population
FROM Country
GROUP BY continent, region
HAVING AVG(population) > 10000;


/* filtering rows before filtering gropus with WHERE and HAVING in the same clause */
SELECT 
    country,
    COUNT(*) AS num_orders,
    SUM(amount) AS total_amount
FROM Orders
WHERE amount > 50                 -- filters rows based on a single column
GROUP BY country
HAVING SUM(amount) > 500;         -- filters groups based on aggregated function


/* grouping and sorting */
SELECT
    customer,
    SUM(amount) AS total_amount
FROM Orders
GROUP BY customer
ORDER BY total_amount DESC;
ORDER BY customer ASC;


/* use of partitions with PARTITION BY 
    Contrary to GROUP BY, PARTITION BY doesn't reduce the number of rows 
    PARTITION BY is used with window functions */
SELECT 
    customer,
    country,
    amount, 
    SUM(amount) OVER (
        PARTITION BY customer
    ) AS customer_total
FROM Orders;
/* each row with identical customer entry would be collapsed with GROUP BY 
    instead, with PARTITION BY those rows remain as they originally are
    a new column would appear with identical values for all identical customers */


