;WITH MAX_COMP (max_comp) AS
(SELECT MAX(months * salary) FROM Employee ee)
SELECT MAX(max_comp), SUM(CASE WHEN (ee.months * ee.salary) = mc.max_comp THEN 1 ELSE 0 END) FROM Employee ee
CROSS APPLY MAX_COMP mc
;