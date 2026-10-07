/*
    EC_IT143_6.3_fwt_s7_ia.sql
    Author: Idio Abasifreke
    Purpose: Fun with Triggers - Step 7
*/

USE EC_IT143_DA;
GO

-- Add a column to store the server user
-- who last modified the record.

ALTER TABLE dbo.t_w3_schools_customers
ADD last_modified_by VARCHAR(128);
GO

-- Create an AFTER UPDATE trigger.
-- SUSER_NAME() returns the current SQL Server login name.

CREATE TRIGGER dbo.trg_w3_customers_last_modified_by
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN

    SET NOCOUNT ON;

    UPDATE c
    SET last_modified_by = SUSER_NAME()
    FROM dbo.t_w3_schools_customers AS c
    INNER JOIN inserted AS i
        ON c.CustomerID = i.CustomerID;

END;
GO