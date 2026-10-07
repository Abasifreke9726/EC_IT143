/*
    EC_IT143_6.3_fwf_s5_ia.sql
    Author: Idio Abasifreke
    Purpose: Fun with Functions - Last Name Step 5
*/

USE EC_IT143_DA;
GO

-- This function extracts the last name from a ContactName value.
CREATE FUNCTION dbo.ufn_GetLastName
(
    @ContactName VARCHAR(100)
)
RETURNS VARCHAR(100)
AS
BEGIN

    DECLARE @LastName VARCHAR(100);

    SET @LastName =
        CASE
            WHEN CHARINDEX(' ', @ContactName) > 0
            THEN RIGHT(@ContactName, CHARINDEX(' ', REVERSE(@ContactName)) - 1)
            ELSE @ContactName
        END;

    RETURN @LastName;

END;
GO