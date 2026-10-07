/*
    EC_IT143_6.3_fwf_s7_ia.sql
    Author: Idio Abasifreke
    Purpose: Fun with Functions - Last Name Step 7
*/

USE EC_IT143_DA;
GO

-- The query should return 0 rows if the UDF
-- produces the same result as the ad hoc query.

WITH LastNameComparison AS
(
    SELECT
        ContactName,

        CASE
            WHEN CHARINDEX(' ', ContactName) > 0
            THEN RIGHT(ContactName, CHARINDEX(' ', REVERSE(ContactName)) - 1)
            ELSE ContactName
        END AS AdHocLastName,

        dbo.ufn_GetLastName(ContactName) AS UDF_LastName

    FROM dbo.t_w3_schools_customers
)

SELECT
    ContactName,
    AdHocLastName,
    UDF_LastName
FROM LastNameComparison
WHERE AdHocLastName <> UDF_LastName;