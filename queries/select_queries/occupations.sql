/*
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted 
alphabetically and displayed underneath its corresponding Occupation. 
The output should consist of four columns (Doctor, Professor, Singer, and Actor) 
in that specific order, with their respective names listed alphabetically under each column.

Note: Print NULL when there are no more names corresponding to an occupation.
*/

WITH ranked AS (
    SELECT
        NAME,
        OCCUPATION,
        ROW_NUMBER() OVER (
            PARTITION BY OCCUPATION
            ORDER BY NAME
        ) AS rn
    FROM OCCUPATIONS
)
SELECT
    MAX(CASE WHEN OCCUPATION = 'Doctor' THEN NAME END) AS Doctor,
    MAX(CASE WHEN OCCUPATION = 'Professor' THEN NAME END) AS Professor,
    MAX(CASE WHEN OCCUPATION = 'Singer' THEN NAME END) AS Singer,
    MAX(CASE WHEN OCCUPATION = 'Actor' THEN NAME END) AS Actor
FROM ranked
GROUP BY rn
ORDER BY rn;
