CREATE PROCEDURE dbo.usp_soccer_players_by_team
AS
BEGIN

    TRUNCATE TABLE dbo.t_soccer_players_by_team;

    INSERT INTO dbo.t_soccer_players_by_team
    (
        t_id,
        PlayerCount
    )
    SELECT
        t_id,
        PlayerCount
    FROM dbo.v_soccer_players_by_team;

END;