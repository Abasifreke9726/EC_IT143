DROP TABLE dbo.t_credit_card_spending_by_member;

CREATE TABLE dbo.t_credit_card_spending_by_member
(
    member_id INT IDENTITY(1,1) PRIMARY KEY,
    Member_Name VARCHAR(100) NOT NULL,
    TotalSpent DECIMAL(18,2) NOT NULL
);