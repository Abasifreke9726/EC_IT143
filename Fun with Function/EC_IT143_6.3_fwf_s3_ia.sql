/*
    EC_IT143_6.3_fwf_s3_ia.sql
    Author: Idio Abasifreke
    Purpose: Fun with Functions - Last Name Step 3
*/

-- Question:
-- How do I extract the last name from ContactName?

SELECT
    ContactName,
    CASE
        WHEN CHARINDEX(' ', ContactName) > 0
        THEN RIGHT(ContactName, CHARINDEX(' ', REVERSE(ContactName)) - 1)
        ELSE ContactName
    END AS LastName
FROM dbo.t_w3_schools_customers;