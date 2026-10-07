/*
    EC_IT143_6.3_fwf_s4_ia.sql
    Author: Idio Abasifreke
    Purpose: Fun with Functions - Last Name Step 4
*/

-- Question:
-- How do I extract the last name from ContactName?

-- Research:
-- RIGHT returns characters from the right side of a character expression.
-- CHARINDEX returns the starting position of a specified expression.
-- REVERSE reverses the order of characters in a string.

-- Solution tested:
-- Find the first space from the right side of ContactName
-- and return the characters after that space.

SELECT
    ContactName,
    CASE
        WHEN CHARINDEX(' ', ContactName) > 0
        THEN RIGHT(ContactName, CHARINDEX(' ', REVERSE(ContactName)) - 1)
        ELSE ContactName
    END AS LastName
FROM dbo.t_w3_schools_customers;

-- Sources:
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/right-transact-sql
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/charindex-transact-sql
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/reverse-transact-sql