SELECT
    e.employee_id,
    e.first_name,
    d.department_id,
    d.department_name
FROM
    departments d,
    employees   e
WHERE
    d.department_id (+) = e.department_id;

SELECT
    e.employee_id,
    e.first_name,
    d.department_id,
    d.department_name
FROM
    employees   e
    LEFT OUTER JOIN departments d ON e.department_id = d.department_id;