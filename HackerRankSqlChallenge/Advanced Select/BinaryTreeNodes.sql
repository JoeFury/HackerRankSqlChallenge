IF EXISTS(SELECT * FROM sys.tables WHERE name = 'BST')
	DROP TABLE BST

CREATE TABLE BST(N int, P int)


INSERT INTO BST VALUES 
(1,2),(3,2),(6,8),(9,8),(2,5),(8,5), (5, null)


SELECT 
	N
,	CASE 
		WHEN P IS NULL THEN 'Root'
		WHEN (SELECT COUNT(*) FROM BST sub WHERE sub.P = b.N) > 0 THEN 'Inner' 
		ELSE 'Leaf'
	END 
FROM BST b
ORDER BY N;