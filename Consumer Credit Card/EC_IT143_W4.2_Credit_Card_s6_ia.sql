TRUNCATE TABLE dbo.t_credit_card_spending_by_member;

INSERT INTO dbo.t_credit_card_spending_by_member
(
    Member_Name,
    TotalSpent
)
SELECT
    Member_Name,
    TotalSpent
FROM dbo.v_credit_card_spending_by_member;