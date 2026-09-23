CREATE PROCEDURE dbo.usp_hello_world
AS
BEGIN

    TRUNCATE TABLE dbo.t_hello_world;

    INSERT INTO dbo.t_hello_world
    (
        HelloWorld
    )
    SELECT
        HelloWorld
    FROM dbo.v_hello_world;

END;