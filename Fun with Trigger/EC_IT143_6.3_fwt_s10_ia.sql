/*
    EC_IT143_6.3_fwt_s10_ia.sql
    Author: Idio Abasifreke
    Purpose: Fun with Triggers - Prevent Trigger Nesting
*/

USE EC_IT143_DA;
GO

-- Prevent the trigger from repeatedly calling itself.

ALTER TRIGGER dbo.trg_w3_customers_last_modified
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN

    SET NOCOUNT ON;

    IF TRIGGER_NESTLEVEL() > 1
        RETURN;

    UPDATE c
    SET
        last_modified_date = GETDATE(),
        last_modified_by = SUSER_NAME()
    FROM dbo.t_w3_schools_customers AS c
    INNER JOIN inserted AS i
        ON c.CustomerID = i.CustomerID;

END;
GO