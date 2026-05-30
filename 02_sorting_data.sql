/* SORTING DATA */
SELECT * 
FROM tableName
ORDER BY col1 

SELECT * 
FROM tableName
ORDER BY co1, col2 -- ties are broken using columns to the right

/* sort by column position */
SELECT col1, col2, col3, col4
FROM tableName
ORDER BY 2 -- sorts by the second column in the SELECT statement 

/* specify sorting direction */
SELECT *
FROM Employees
ORDER BY department ASC, salary DESC;

SELECT * 
FROM Employees 
ORDER BY department DESC;