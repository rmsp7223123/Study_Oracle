select count(commission_pct) as "켜미션 받는 사원 수"
from employees;

select *
from employees
where commission_pct is not null;

select employee_id, first_name, hire_date
from employees
where commission_pct is not null;

select round(avg(salary), 2)
from employees
where department_id = 90;

select department_id, count(*) as cnt
from employees
group by department_id
order by 1;

select first_name, count(*)as cnt
from employees
group by first_name
having count(*) >=2
order by 2 desc;

select department_id, sum(salary), round(avg(salary)) as avg_sal
from employees
group by department_id
having round(avg(salary)) >= 8000
order by 1 asc;

select hire_date, to_char(hire_date, 'YYYY') as year
from employees;