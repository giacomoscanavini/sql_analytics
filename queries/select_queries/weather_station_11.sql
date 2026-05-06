Query the list of CITY names from STATION that either do not start with vowels or 
do not end with vowels. Your result cannot contain duplicates.
*/

SELECT DISTINCT CITY
FROM STATION 
WHERE CITY NOT IN (
    SELECT DISTINCT CITY
    FROM STATION 
    WHERE CITY LIKE 'a%'
    OR CITY LIKE 'e%'
    OR CITY LIKE 'i%'
    OR CITY LIKE 'o%'
    OR CITY LIKE 'u%'
) OR CITY NOT IN (
    SELECT DISTINCT CITY
    FROM STATION 
    WHERE CITY LIKE '%a'
    OR CITY LIKE '%e'
    OR CITY LIKE '%i'
    OR CITY LIKE '%o'
    OR CITY LIKE '%u'
)