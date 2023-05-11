desc employees;

select distinct manager_id
from employees
where manager_id is not null;