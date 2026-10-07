/*
    EC_IT143_6.3_fwt_s11_ia.sql
    Author: Idio Abasifreke
    Purpose: Fun with Triggers - Test Last Modified Information
*/

USE EC_IT143_DA;
GO

-- Update an existing customer record.
-- The trigger should automatically record:
-- 1. The date and time of the update.
-- 2. The SQL Server user who made the update.

UPDATE dbo.t_w3_schools_customers
SET ContactName = ContactName
WHERE CustomerID = 1;
GO

-- Check the trigger results.

SELECT
    CustomerID,
    ContactName,
    last_modified_date,
    last_modified_by
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;
GO