SELECT
    [Doctor], [Professor], [Singer], [Actor]
FROM
(
    SELECT Name, Occupation, ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) AS RowOrder FROM Occupations
) AS tempTable
PIVOT
(
    MAX(Name) FOR Occupation IN ([Doctor], [Professor], [Singer], [Actor])
) AS pvt;