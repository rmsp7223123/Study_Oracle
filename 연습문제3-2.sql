SELECT
    first_name,
    lpad(salary, 15, '$') AS salary,
    '$' || salary         AS salary2
FROM
    employees
WHERE
    department_id = 80;

SELECT
    employee_id,
    first_name,
    phone_number,
    phone_number AS "Local Number",
    department_id
FROM
    employees
WHERE
    department_id IN ( 60, 80, 100 )
ORDER BY
    department_id ASC;

SELECT
    employee_id,
    first_name,
    salary,
    round(months_between(sysdate, hire_date)) AS "근무 개월 수"
FROM
    employees
WHERE
    department_id = 30;

SELECT
    employee_id,
    first_name
    || ' '
    || last_name                      AS name,
    ltrim(to_char(salary, '999,999')) AS salary
FROM
    employees
WHERE
    salary >= 12000
ORDER BY
    salary DESC;

SELECT
    employee_id,
    first_name
    || ' '
    || last_name AS name,
    hire_date, to_char(hire_date, 'day') as "업무 시작 요일"
from employees
where to_char(hire_date, 'YYYY') < '2005'
order by 3 desc;