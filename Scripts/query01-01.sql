select e.firstName, 
        e.lastName, 
        m.firstName as managerFirstName, 
        m.lastName as managerLastName
from employee e
left join employee m on e.managerId = m.employeeId
;