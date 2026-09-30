/*
Question 1:
Which soccer players have the highest monthly salaries,
and what teams and positions are those players associated with?

Original Author: Idio Abasifreke
*/

SELECT
    p.pl_name AS Player_Name,
    MAX(f.mtd_salary) AS Monthly_Salary,
    t.t_code AS Team_Code,
    pos.p_name AS Position_Name
FROM dbo.tblPlayerDim AS p
INNER JOIN dbo.tblPlayerFact AS f
    ON p.pl_id = f.pl_id
INNER JOIN dbo.tblTeamDim AS t
    ON p.t_id = t.t_id
INNER JOIN dbo.tblPositionDim AS pos
    ON p.p_id = pos.p_id
GROUP BY
    p.pl_name,
    t.t_code,
    pos.p_name
ORDER BY
    Monthly_Salary DESC;
GO

/*
Question 2:
Which teams have the most players, and what positions do those players occupy?

Original Author: Idio Abasifreke
*/

SELECT
    t.t_code AS Team_Code,
    pos.p_name AS Position_Name,
    COUNT(DISTINCT p.pl_id) AS Player_Count
FROM dbo.tblPlayerDim AS p
INNER JOIN dbo.tblTeamDim AS t
    ON p.t_id = t.t_id
INNER JOIN dbo.tblPositionDim AS pos
    ON p.p_id = pos.p_id
GROUP BY
    t.t_code,
    pos.p_name
ORDER BY
    Player_Count DESC;
GO

/*
Question 3:
Which player positions have the highest average monthly salary,
and which players are included in those positions?

Original Author: Idio Abasifreke
*/

SELECT
    pos.p_name AS Position_Name,
    p.pl_name AS Player_Name,
    f.mtd_salary AS Monthly_Salary,
    AVG(f.mtd_salary) OVER (PARTITION BY pos.p_name) AS Average_Position_Salary
FROM dbo.tblPlayerDim AS p
INNER JOIN dbo.tblPlayerFact AS f
    ON p.pl_id = f.pl_id
INNER JOIN dbo.tblPositionDim AS pos
    ON p.p_id = pos.p_id
ORDER BY
    Average_Position_Salary DESC,
    f.mtd_salary DESC;
GO

/*
Question 4:
Which team has the highest total month-to-date salary (mtd_salary)
across all of its players, and what is that total?

Original Author: Mmbone Christine
*/

SELECT
    t.t_code AS Team_Code,
    SUM(f.mtd_salary) AS Total_Month_To_Date_Salary
FROM dbo.tblPlayerDim AS p
INNER JOIN dbo.tblPlayerFact AS f
    ON p.pl_id = f.pl_id
INNER JOIN dbo.tblTeamDim AS t
    ON p.t_id = t.t_id
GROUP BY
    t.t_code
ORDER BY
    Total_Month_To_Date_Salary DESC;
GO