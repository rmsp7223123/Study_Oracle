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
    AND e.job_id = j.job_id;


--NON_EQUI JOIN

--OUTER JOIN

--SELF JOIN

--ANSI JOIN