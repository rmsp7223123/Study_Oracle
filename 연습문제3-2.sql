select first_name, lpad(salary, 15, '$') as salary, '$' || salary as salary2
from employees
where department_id = 80;

select employee_id, first_name, phone_number, phone_number AS "Local Number", department_id
from employees
where department_id in (60,80,100)
order by department_id asc;