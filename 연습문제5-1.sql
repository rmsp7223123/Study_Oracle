SELECT
    e.employee_id,
    e.first_name,
    d.department_name
FROM
    employees   e,
    departments d
WHERE
        e.department_id = d.department_id (+)
    AND e.first_name LIKE '%v%'
ORDER BY
    1;

SELECT
    e.employee_id,
    e.first_name,
    e.salary,
    e.salary * e.commission_pct AS comm_pct,
    d.department_id
FROM
    employees   e,
    departments d
WHERE
    commission_pct IS NOT NULL
    AND e.department_id = d.department_id;

SELECT
    d.department_id,
    d.department_name,
    d.location_id,
    l.city,
    l.country_id,
    c.country_name
FROM
    departments d,
    locations   l,
    countries   c
WHERE
        d.location_id = l.location_id
    AND l.country_id = c.country_id
ORDER BY
    1;

SELECT
    e.employee_id,
    e.first_name,
    d.department_name,
    l.city,
    l.street_address
FROM
    employees   e,
    departments d,
    locations   l
WHERE
        e.department_id = d.department_id (+)
    AND d.location_id = l.location_id (+);
    
select e.employee_id, e.first_name, e.department_id,
d.department_name
from employees e, departments d
where e.department_id = d.department_id(+)
and e.manager_id is not null
order by 1;