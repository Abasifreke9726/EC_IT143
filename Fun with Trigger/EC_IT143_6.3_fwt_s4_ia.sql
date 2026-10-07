/*
    EC_IT143_6.3_fwt_s4_ia.sql
    Author: Idio Abasifreke
    Purpose: Fun with Triggers - Step 4
*/

USE EC_IT143_DA;
GO

-- Add a column to store the date and time
-- when a customer record was last modified.

ALTER TABLE dbo.t_w3_schools_customers
ADD last_modified_date DATETIME;
GO

-- Create an AFTER UPDATE trigger.
-- The trigger automatically records the current
-- date and time whenever a customer record is updated.

CREATE TRIGGER dbo.trg_w3_customers_last_modified_date
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN

    SET NOCOUNT ON;

    UPDATE c
    SET last_modified_date = GETDATE()
    FROM dbo.t_w3_schools_customers AS c
    INNER JOIN inserted AS i
        ON c.CustomerID = i.CustomerID;

END;
GO