/* FILTERING DATA */
/* Rows can be filtered using WHERE 
   Operators:
   - equality: =
   - disequality: <>
   - less than: <
   - more than: >
   - less or equal to: <= 
   - more of equal to: >=
   - No value: IS NULL
   - range: BETWEEN 
*/

/* matching content of a column */
SELECT * 
FROM Employees 
WHERE department = 'Accounting' OR department = 'Sales'
WHERE department = 'Accounting' AND salary = 10000
WHERE department <> 'Accounting' AND salary > 10000
WHERE (salary < 900000 OR salary > 1000000 ) AND department <> 'Accounting' AND salary > 0

/* non-matching contect of a column */
SELECT city_name, city_population
FROM City 
WHERE continent <> 'Asia'

/* belonging to a range */
SELECT * 
FROM City 
WHERE city_population BETWEEN 0 AND 100000

/* checking for No Value */
SELECT *
FROM Country
WHERE city_population IS NULL
WHERE city_population IS NOT NULL

/* filter using IN operator */
SELECT *
FROM Employees
WHERE department IN ('Sales', 'Marketing', 'Finance')
/* this is equivalent to 
    WHERE department = 'Sales'
        OR department = 'Marketing'
        OR department = 'Finance'; */
SELECT *
FROM Employees
WHERE department NOT IN ('Sales', 'Marketing', 'Finance')


/* filtering using WILDCARDS for row string content */
SELECT * 
FROM Employees 
WHERE firstName LIKE 'A%'          -- Starts with A
WHERE firstName LIKE '%son'        -- Ends with son
WHERE firstName LIKE '%mar%'       -- Contains mar
WHERE firstName LIKE '_a%'         -- Second letter is a
WHERE firstName LIKE '___'         -- Exactly 3 characters
WHERE firstName LIKE 'A%n'         -- Starts with A and ends with n
WHERE firstName LIKE 'A__n'        -- Starts with A, any two characters, ends with n
WHERE firstName NOT LIKE '%test%'  -- Does not contain test