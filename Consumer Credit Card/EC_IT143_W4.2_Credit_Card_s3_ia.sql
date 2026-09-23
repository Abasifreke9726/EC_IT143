SELECT
    Member_Name,
    SUM(Debit) AS TotalSpent
FROM dbo.FBS_Viza_Costmo
GROUP BY
    Member_Name
ORDER BY
    Member_Name;