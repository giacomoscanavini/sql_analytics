/* WINDOW FUNCTIONS */

/* window functions with aggregate */
SELECT 
    continent,
    MIN(population) OVER (
        PARTITION BY continent
) AS min_population
FROM Country;

/* Ranking window functions:
    ROW_NUMBER()        Sequential integer to each row within partition or table, doesn't care about duplicates
    RANK()              Rank number to each row in partition of table, ties have same rank numbers are skipped
    DENSE_RANK()        Rank number to each row in partition of table, ties have smae rank no number is skipped
    PERCENT_RANK()      Rank number as a percentage, ties have same rank
    NTILE(x)            Assign bucket number to a row in a partition, divides total rows in a partition into x buckets
    CUME_DIST()         Value between 0 and 1 based on percentage of rows <= current row, ties have same value
*/

/* windown functions with ranking and PARTITION BY*/
SELECT 
    continent, 
    RANK() OVER (
        PARTITION BY continent
        ORDER BY population DESC
    ) AS population_order
FROM Country;

SELECT
    continent,
    ROW_NUMBER() OVER p_code AS _row_number,
    RANK() OVER p_code AS _rank,
    DENSE_RANK() OVER p_code AS _dense_rank
FROM Country
WINDOW p_code AS (
    PARTITION BY continent 
    ORDER BY population ASC
);


/* window function don't require PARTITION BY to work */
SELECT 
    continent, 
    population,
    ROW_NUMBER() OVER (ORDER BY population) AS _row_number,
    RANK() OVER (ORDER BY population) AS _rank,
    DENSE_RANK() OVER (ORDER BY population) AS _dense_rank
FROM Country;


/* window functions with value */
SELECT 
    product_name,
    list_price, 
    FIRST_VALUE(list_price) OVER part AS cheap,
    NTH_VALUE(list_price, 2) OVER part AS second_cheap,
    NTH_VALUE(list_price, 3) OVER part AS third_cheap,
    LAST_VALUE(list_price) OVER part AS expensive
FROM Products
WINDOW part AS (
    PARTITION BY department
    ORDER BY list_price ASC, product_name ASC
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING -- this is required to force LAST_VALUE() to check within the whole partition and not up to the current row
);


/* window functions with analytics */
SELECT 
    time_stamp,
    close_price,
    LAG(close_price, offset, default_value) OVER (ORDER BY time_stamp) AS yesterday_close, -- LAG() shifts down by offset (typically 1), and can provide default_value otherwise is NULL
    LEAD(close_price, offset, default_value) OVER (ORDER BY time_stamp) AS tomorrow_close  -- LEAD() shifts up by offset (typically 1), and can provide default_value otherwise is NULL
FROM Stock;