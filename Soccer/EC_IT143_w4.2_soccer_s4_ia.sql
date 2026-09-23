CREATE VIEW dbo.v_soccer_players_by_team
AS
SELECT
    t_id,
    COUNT(*) AS PlayerCount
FROM dbo.tblPlayerDim
GROUP BY
    t_id;