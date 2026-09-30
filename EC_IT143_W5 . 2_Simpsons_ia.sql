/*
Question 1:
How much money is being spent by each card member,
and what spending categories account for the largest amounts?

Original Author: Idio Abasifreke
*/

SELECT
    Member_Name,
    Description,
    SUM(Debit) AS Total_Spending
FROM dbo.FBS_Viza_Costmo
WHERE Debit IS NOT NULL
GROUP BY
    Member_Name,
    Description
ORDER BY
    Total_Spending DESC;
GO

/*
Question 2:
Which transaction categories have the highest total spending,
and which card members are responsible?

Original Author: Idio Abasifreke
*/

SELECT
    Description,
    Member_Name,
    SUM(Debit) AS Total_Spending
FROM dbo.FBS_Viza_Costmo
WHERE Debit IS NOT NULL
GROUP BY
    Description,
    Member_Name
ORDER BY
    Total_Spending DESC;
GO

/*
Question 3:
Which card members have both debit and credit transactions,
and what are the amounts?

Original Author: Idio Abasifreke
*/

SELECT
    Member_Name,
    SUM(CASE WHEN Debit IS NOT NULL THEN Debit ELSE 0 END) AS Total_Debit,
    SUM(CASE WHEN Credit IS NOT NULL THEN Credit ELSE 0 END) AS Total_Credit
FROM dbo.FBS_Viza_Costmo
GROUP BY
    Member_Name
HAVING
    SUM(CASE WHEN Debit IS NOT NULL THEN 1 ELSE 0 END) > 0
    AND
    SUM(CASE WHEN Credit IS NOT NULL THEN 1 ELSE 0 END) > 0
ORDER BY
    Member_Name;
GO

/*
Question 4:
Which family member has the highest total transactions in Planet_Express?

Original Author: Mmbone Christine
*/

SELECT
    Card_Member,
    SUM(Amount) AS Total_Transactions
FROM dbo.Planet_Express
GROUP BY
    Card_Member
ORDER BY
    Total_Transactions DESC;
GO