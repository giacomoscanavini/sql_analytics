/*
Amber's conglomerate corporation just acquired some new companies. 
Each of the companies follows this hierarchy:
Founder, Lead Manager, Senior Manager, Manager, Employee

Given the table schemas below, write a query to print the company_code, 
founder name, total number of lead managers, total number of senior managers, 
total number of managers, and total number of employees. 
Order your output by ascending company_code.

Note:
The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. 
For example, if the company_codes are C_1, C_2, and C_10, 
then the ascending company_codes will be C_1, C_10, and C_2.
*/

SELECT c.COMPANY_CODE, 
       c.FOUNDER,
       (SELECT COUNT(DISTINCT lm.LEAD_MANAGER_CODE)
        FROM LEAD_MANAGER AS lm
        WHERE lm.COMPANY_CODE = c.COMPANY_CODE),
        
        (SELECT COUNT(DISTINCT sm.SENIOR_MANAGER_CODE)
         FROM SENIOR_MANAGER AS sm
         WHERE sm.COMPANY_CODE = c.COMPANY_CODE),
        
        (SELECT COUNT(DISTINCT ma.MANAGER_CODE)
         FROM MANAGER AS ma
         WHERE ma.COMPANY_CODE = c.COMPANY_CODE),
        
        (SELECT COUNT(DISTINCT em.EMPLOYEE_CODE)
         FROM EMPLOYEE AS em
         WHERE em.COMPANY_CODE = c.COMPANY_CODE)
        
FROM COMPANY AS c
ORDER BY c.COMPANY_CODE ASC;
