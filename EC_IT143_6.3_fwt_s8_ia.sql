/*
    EC_IT143_6.3_fwt_s8_ia.sql
    Author: Idio Abasifreke
    Purpose: Fun with Triggers - Step 8
*/

USE EC_IT143_DA;
GO

-- Test the last modified by trigger.

UPDATE dbo.t_w3_schools_customers
SET ContactName = ContactName
WHERE CustomerID = 1;
GO

-- Check the result.

SELECT
    CustomerID,
    ContactName,
    last_modified_date,
    last_modified_by
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;
GO