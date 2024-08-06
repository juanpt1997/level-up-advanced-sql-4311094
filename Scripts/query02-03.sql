SELECT emp.*, count(sls.salesId) as 'soldCars'
from employee emp
inner join sales sls on sls.employeeId = emp.employeeId
where sls.soldDate>='2023-01-01'
group by emp.employeeId
having soldCars > 5
order by soldCars DESC;

-- SELECT * from sales;