/*
    EC_IT143_6.3_fwt_s3_ia.sql
    Author: Idio Abasifreke
    Purpose: Fun with Triggers - Step 3
*/

USE EC_IT143_DA;
GO

-- Question:
-- How do I keep track of when a record was last modified?

-- Research:
-- An AFTER UPDATE trigger can run automatically after a record is updated.
-- GETDATE() returns the current date and time.

-- Test the current table structure.
SELECT TOP 10
    *
FROM dbo.t_w3_schools_customers;