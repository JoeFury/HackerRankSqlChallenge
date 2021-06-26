IF EXISTS(SELECT * FROM sys.tables WHERE name = 'Occupations')
	DROP TABLE Occupations

CREATE TABLE Occupations(Name VARCHAR(100), Occupation VARCHAR(100))


INSERT INTO Occupations VALUES 
('Samantha', 'Doctor'),
('Julia','Actor'),
('Maria','Actor'),
('Meera','Singer'),
('Ashely','Professor'),
('Ketty','Professor'),
('Christeen','Professor'),
('Jane','Actor'),
('Jenny', 'Doctor')



SELECT
    [Doctor], [Professor], [Singer], [Actor]
FROM
(
    SELECT Name, Occupation, ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) AS RowOrder FROM Occupations
) AS tempTable
PIVOT
(
    MAX(Name) FOR Occupation IN ([Doctor], [Professor], [Singer], [Actor])
) AS pvt