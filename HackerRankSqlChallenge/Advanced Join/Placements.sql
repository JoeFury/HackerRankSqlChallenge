SELECT s.Name 
FROM Students s
JOIN Friends f ON s.ID= f.ID
JOIN Packages sp ON s.ID = sp.ID
JOIN Packages fp ON f.Friend_Id = fp.ID
AND sp.Salary < fp.Salary
GROUP BY s.Name
ORDER BY MAX(fp.Salary);