/*
    EC_IT143_6.3_fwt_s5_ia.sql
    Author: Idio Abasifreke
    Purpose: Fun with Triggers - Step 5
*/

USE EC_IT143_DA;
GO

-- Test the trigger by updating an existing record.
-- The trigger should automatically set last_modified_date.

UPDATE dbo.t_w3_schools_customers
SET ContactName = ContactName
WHERE CustomerID = 1;
GO

-- Check the result.
SELECT
    CustomerID,
    ContactName,
    last_modified_date
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;
GO