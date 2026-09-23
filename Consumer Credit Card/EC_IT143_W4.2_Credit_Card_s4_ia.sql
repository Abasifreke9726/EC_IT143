CREATE VIEW dbo.v_credit_card_spending_by_member
AS
SELECT
    Member_Name,
    SUM(Debit) AS TotalSpent
FROM dbo.FBS_Viza_Costmo
GROUP BY
    Member_Name;