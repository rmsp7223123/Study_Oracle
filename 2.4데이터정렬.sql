--�⺻������ �ش� ���̺��� �ĺ���(=�����ϰ�, �ߺ����� �ʴ� �����͸� �����ϴ� � ��)
SELECT
    *
FROM
    employees
ORDER BY
    �÷��� [asc|desc]; -- [] : �ɼ� , asc(=�⺻��)
--asc : ascending / ��������
--desc : descending / ��������

--desc or describe : ���̺��� ���� ��ȸ(=���̺��� �÷� ����, �ڷ���, ���̰�)
--���� : select ���� ���Ͽ��� ��ȸ�� ����� Ư�� �÷��� �������� ���� ��������, �������� ����

SELECT
    *
FROM
    employees
WHERE
    department_id = 80
ORDER BY
    first_name DESC; --��������


-- 1
SELECT
    last_name || ' '
                 || first_name name,
    department_id
FROM
    employees
WHERE
    employee_id = 200;


-- 2
SELECT
    last_name || ' '
                 || first_name name,
    employee_id,
    salary
FROM
    employees
WHERE
    salary not between 3000 and 15000;


-- 3
SELECT
    last_name || ' '
                 || first_name name,
    employee_id,
    salary,
    department_id
from
    employees
where
    department_id in(30,60)
order by last_name
asc;


-- 4
SELECT
    last_name || ' '
                 || first_name name,
    employee_id,
    salary        AS monthly_salary,
    department_id
FROM
    employees
WHERE
    department_id IN ( 30, 60 )
    AND salary BETWEEN 3000 AND 15000;


-- 5
SELECT
    last_name || ' '
                 || first_name name,
    employee_id,
    salary,
    employee_id,
    department_id
FROM
    employees
WHERE
    department_id IS NULL;


-- 6
SELECT
    last_name || ' '
                 || first_name name,
    employee_id,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct IS NOT NULL
ORDER BY
    commission_pct DESC;


-- 7
SELECT
    last_name || ' '
                 || first_name name,
    employee_id
FROM
    employees
WHERE
    last_name LIKE '%z%';
    
select *
from employees
order by last_name ASC, salary desc;