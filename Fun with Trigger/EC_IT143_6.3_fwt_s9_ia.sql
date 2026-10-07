USE EC_IT143_DA;
GO

CREATE TRIGGER dbo.trg_w3_customers_last_modified
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN

    SET NOCOUNT ON;

    UPDATE c
    SET
        last_modified_date = GETDATE(),
        last_modified_by = SUSER_NAME()
    FROM dbo.t_w3_schools_customers AS c
    INNER JOIN inserted AS i
        ON c.CustomerID = i.CustomerID
    WHERE c.last_modified_date IS NULL
       OR c.last_modified_by IS NULL
       OR c.last_modified_date <> GETDATE();

END;
GO 