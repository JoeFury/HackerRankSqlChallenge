WITH CTE 
AS
(
    SELECT f1.X, f1.Y, ROW_NUMBER() OVER (ORDER BY f1.X) AS RowNumber
    FROM Functions f1
) 
SELECT DISTINCT f1.X, f1.Y
FROM CTE f1
JOIN CTE f2
    ON f1.X = f2.Y
    AND f1.Y = f2.X
    AND f1.RowNumber <> f2.RowNumber
WHERE f1.X <= f1.Y
ORDER BY f1.X;