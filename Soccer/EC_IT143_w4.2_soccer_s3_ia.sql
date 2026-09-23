SELECT
    t_id,
    COUNT(*) AS PlayerCount
FROM dbo.tblPlayerDim
GROUP BY
    t_id
ORDER BY
    t_id;