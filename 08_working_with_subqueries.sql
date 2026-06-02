/* WORKING WITH SUBQUERIES */
/* Subqueries are nested queries inside another SQL query */
/* They can be used in SELECT, FROM, WHERE, and HAVING clauses */


/* Subquery with WHERE and a single row */
SELECT firstName, lastName, salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary) -- subquery returns a single value
    FROM Employees
);


/* Subquery with WHERE and multiple rows */
SELECT firstName, lastName, departmentId
FROM Employees
WHERE departmentId IN (
    SELECT departmentId  -- subquery might return more than one value so using IN is more appropriate
    FROM Departments
    WHERE city = 'New York'
);
/* A similar result can be achieve with CTE */
WITH newyork_ids AS (
    SELECT departmentId
    FROM Departments
    WHERE city = 'New York'
)
SELECT firstName, lastName, departmentId
FROM Employees
WHERE departmentId IN (
    SELECT departmentId 
    FROM newyork_ids
);


/* Subquery in the FROM clause which returns a Table */
SELECT firstName, lastName
FROM (
    SELECT *
    FROM Employees
    WHERE salary > 10000
) AS high_salary_employees;


/* Subquery in the SELECT clause which returns a single value */
SELECT 
    firstName,
    salary,
    salary - (
        SELECT AVG(salary) 
        FROM Employees
    ) AS highest_salary
FROM Employees;


/* Subqueries with EXISTS */
SELECT department_name
FROM Departments d
WHERE EXISTS (
    SELECT 1
    FROM Employees e
    WHERE e.departmentId = d.id
);


/* Sometimes a JOIN statement is faster and more readable than a subquery */
SELECT firstName
FROM Employees
WHERE departmentId IN (
    SELECT id 
    FROM Departments
    WHERE city = 'Tokyo'
);

SELECT e.firstName
FROM Employees e
LEFT JOIN Departments d
    ON e.departmentId = d.id
WHERE city = 'Tokyo';