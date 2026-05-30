/* RETRIEVING DATA */
SELECT col1, col2
FROM tableName

/* all columns */
SELECT * 
FROM tableName

/* only unique rows */
SELECT DISTINCT col1, col2
FROM tableName

/* only unique rows with all columns */
SELECT DISTINCT * 
FROM tableName

/* limit selected rows to first 5 */
SELECT col1, col2
FROM tableName
LIMIT 5

/* limit selected rows to first 5, but skip first 13, so the first selected will be row 14th */
SELECT col1, col2
FROM tableName
LIMIT 5, 13


/* DUPLICATE ROWS IDENTIFICATION */
/* using IN operator
    IN is applied to a column and requires a table with a single column to be generated */
SELECT * 
FROM City
WHERE city_name IN (
    SELECT city_name
    FROM City
    GROUP BY city_name
    HAVING COUNT(city_name) > 1
)

/* using Common Table Expression (CTE) 
    allows to split complex query into multiple parts */
WITH DuplicateCity AS (
    SELECT city_name
    FROM City
    GROUP BY city_name
    HAVING COUNT(city_name) > 1
)
SELECT *
FROM City
WHERE city_name IN (
    SELECT city_name
    FROM DuplicateCity -- use table generated with CTE
)

