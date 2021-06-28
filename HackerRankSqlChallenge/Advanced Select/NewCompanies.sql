SELECT
    c.company_code, 
    MAX(c.founder),
    COUNT(DISTINCT lmgr.lead_manager_code),
    COUNT(DISTINCT smgr.senior_manager_code),
    COUNT(DISTINCT mgr.manager_code),
    COUNT(DISTINCT ee.employee_code)
FROM Company c
LEFT JOIN Lead_Manager lmgr on lmgr.company_code = c.company_code
LEFT JOIN Senior_Manager smgr on smgr.lead_manager_code = lmgr.lead_manager_code
LEFT JOIN Manager mgr on mgr.senior_manager_code = smgr.senior_manager_code
LEFT JOIN Employee ee on ee.manager_code = mgr.manager_code
GROUP BY c.company_code
ORDER BY c.company_code