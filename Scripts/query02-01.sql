SELECT emp.*, count(sls.salesId) as numOfCarsSold
from employee emp
inner join sales sls on sls.employeeId = emp.employeeId
group by emp.employeeId
order by numOfCarsSold DESC;