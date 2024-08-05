SELECT emp.* 
FROM employee emp
LEFT JOIN sales s 
  ON emp.employeeId = s.employeeId
WHERE 
  emp.title = 'Sales Person' and
  s.salesAmount is NULL; 