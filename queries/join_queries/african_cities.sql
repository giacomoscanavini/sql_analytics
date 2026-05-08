/*
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/


SELECT ci.NAME
FROM CITY AS ci
LEFT JOIN COUNTRY AS co ON ci.COUNTRYCODE = co.CODE
WHERE co.CONTINENT = 'Africa'