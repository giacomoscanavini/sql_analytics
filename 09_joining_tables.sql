/* JOINING TABLES */
/* This process involves dealing with multiple tables that are linked */

/* Simple join with = */
SELECT
    c.name,
    l.language
FROM Country c, CountryLanguage l
WHERE c.code = l.countrycode;


/* Using INNER JOIN for only matching rows (filters out non matching) */
SELECT u.name, o.productName
FROM Users u
INNER JOIN Orders o
    ON u.id = o.user_id;

/* Using LEFT JOIN to keep all rows of the first Table, missing matches for columns in the second Table become NULL */
SELECT u.name, o.productName
FROM Users u
LEFT JOIN Orders o
    ON u.id = o.user_id;

/* Using RIGHT JOIN to keep all rows of the second Table, missing matches for columns in the first Table become NULL */
SELECT u.name, o.productName
FROM Users u
RIGHT JOIN Orders o
    ON u.id = o.user_id;

/* Using FULL OUTER JOIN to return all matching rows and all unmatching rows from both Tables */
SELECT u.name, o.productName
FROM Users u
FULL OUTER JOIN Orders o
    ON u.id = o.user_id;

/* Using CROSS JOIN to return the cartesian product of all rows, meaning every row with every row */
/* This means that if Users has 3 rows and Orders has 4 rows, the result has 3 x 4 = 12 rows */
SELECT u.name, o.productName
FROM Users u
CROSS JOIN Orders o;


/* Multiple Tables can be joined at the same time */
SELECT e.firstName, e.lastName, c.startTime, c.endTime, cout.outcomeText
FROM Employees e
INNER JOIN Calls c ON c.employee_id = e.id
INNER JOIN CallOutcome cout ON c.employee_id = cout.id
ORDER BY c.startTime ASC;

SELECT Country.name, City.name, Customer.name
FROM Country
LEFT JOIN City ON City.countryId = Country.Id
LEFT JOIN Customer ON Customer.cityId = City.Id;
