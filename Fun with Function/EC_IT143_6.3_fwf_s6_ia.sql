/*
    EC_IT143_6.3_fwf_s6_ia.sql
    Author: Idio Abasifreke
    Purpose: Fun with Functions - Last Name Step 6
*/

USE EC_IT143_DA;
GO

-- Compare the ad hoc query result with the user-defined function result.

SELECT
    ContactName,

    -- Ad hoc query result
    CASE
        WHEN CHARINDEX(' ', ContactName) > 0
        THEN RIGHT(ContactName, CHARINDEX(' ', REVERSE(ContactName)) - 1)
        ELSE ContactName
    END AS AdHocLastName,

    -- User-defined function result
    dbo.ufn_GetLastName(ContactName) AS UDF_LastName

FROM dbo.t_w3_schools_customers;