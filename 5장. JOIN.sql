--JOIN(����)
--����Ŭ ������ �����ͺ��̽�==> ���̺�� ���̺��� �δ� ����
--Relation - �����ͺ��̽� ������ �� ���̺��� �����̼��̶�� ��
--join ���� ���̺��� �����Ͽ� (HR:7��, ����: n��)


--Cartesian Product(Decart�� �ٸ���, Cartesian)
--join���� : �� �̻��� ���̺��� ���踦 ���� ��, ������ �Ǵ� �÷��� ���� ==> ���� where���� ���
--JOIN ������ ������� ���� �� �߸��� ����� �߻��ϴµ�, �̰� ī�׽þ� ��(=�ռ���)�̶�� ��
--������ ���� ����
/*
select �÷���1, �÷���2, ...
from ���̺��1, ���̺��2, ...
where join ����(=��)
*/

--EQUI JOIN  : ���� ������(=)�� ����� JOIN ����(=���� ����)
--������ ������ ����� �����ؼ� ����� �ݿ� ==> ����� �� ���
SELECT
    e.employee_id,
    e.last_name,
    d.department_name
FROM
    employees   e,
    departments d
WHERE
    e.department_id = d.department_id;

SELECT
    e.employee_id,
    e.first_name
    || ' '
    || e.last_name AS name,
    e.job_id,
    j.job_title
FROM
    employees e,
    jobs      j
WHERE
    e.job_id = j.job_id
ORDER BY
    1;

SELECT
    e.employee_id  AS ���,
    e.first_name
    || ' '
    || e.last_name AS name,
    d.department_name,
    j.job_title
FROM
    employees   e,
    departments d,
    jobs        j
WHERE
        e.department_id = d.department_id
    AND e.job_id = j.job_id
ORDER BY
    1;

SELECT
    e.employee_id,
    e.first_name,
    d.department_name,
    j.job_title
FROM
    employees   e,
    departments d,
    jobs        j
WHERE
        e.department_id = d.department_id
    AND e.job_id = j.job_id
    AND e.employee_id = 101;

SELECT
    e.employee_id,
    j.job_title
FROM
    employees e,
    jobs      j
WHERE
        e.job_id = j.job_id
    AND e.salary >= j.min_salary
    AND e.salary <= j.max_salary
    AND e.department_id = 10;


--NON_EQUI JOIN

--OUTER JOIN : EQUI JOIN �������� JOIN �ϴ� ���̺� �� �������� �����Ǵ� ���� ���� ����� ������� ��ȯ��.
--             ������ OUTER JOIN�� �����Ǵ� ���� ���� ����� ������� ��ȯ��
--             �����Ǵ� ���� ���� ���̺� �÷��� (+) ��ȣ�� ǥ����.  

SELECT
    e.employee_id     AS empno,
    e.first_name      AS ename,
    e.salary          AS esal,
    d.department_name AS dname
FROM
    employees   e,
    departments d
WHERE
    e.department_id = d.department_id;

--SELF JOIN : �ϳ��� ���̺��� �� �� ����Ͽ�, ������ ���̺� �ΰ��κ��� JOIN�� ���� �����͸� ��ȸȯ ����� ��ȯ��
--���̺��� �����ϴ� ��ó�� JOIN ����
--���̺� ���� : ���� ����(���, Recursive)

SELECT
    employee_id,
    first_name,
    manager_id
FROM
    employees;

--self join
SELECT
    e.employee_id,
    e.first_name,
    m.employee_id AS manager_id,
    m.first_name  AS manager_name
FROM
    employees e,
    employees m
WHERE
    e.manager_id = m.manager_id
ORDER BY
    1;


--ANSI JOIN