SELECT emp.*, min(sls.salesAmount) as leastExpensive, max(sls.salesAmount) as mostExpensive
from employee emp
inner join sales sls on sls.employeeId = emp.employeeId
where sls.soldDate>='2023-01-01' -- date('now', 'start of year')
group by emp.employeeId;

-- SELECT * from sales;