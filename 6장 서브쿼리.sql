--6�� ��������

--SQL���� �ȿ� �����ϴ� �Ǵٸ� SQL����(SELECT ~ FROM~ WHERE)�� ����������� �Ѵ�
--���������� ��ȣ(, ) �� ��� ���
--���������� ���Ե� �������� ���� ������� ��.

--�������� ��� ��
SELECT
    round(AVG(salary)) AS avg_sal
FROM
    employees;

SELECT
    employee_id,
    first_name,
    salary,
    department_id
FROM
    employees
WHERE
    salary < (
        SELECT
            round(AVG(salary)) AS avg_sal
        FROM
            employees
    );

SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary > (
        SELECT
            salary
        FROM
            employees
        WHERE
            employee_id = 108
    );



--      ======���������� ����======
-- �������� ���� ��� ������ ���� ����
-- 1. ���� �� �������� : �ϳ��� ��� ���� ��ȯ�ϴ� ��������
--    ������ �� ������(=, >=, <=, >, <,      <>, !=, ^=)
--    ���׷��Լ��� ����ϴ� ��찡 ���� (AVG, SUM, COUNt, MAX, MIN)

SELECT
    salary
FROM
    employees
ORDER BY
    1 DESC;

SELECT
    MAX(salary) AS max_sal,
    MIN(salary) AS min_sal
FROM
    employees;

SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    salary = 24000;


-- 2. ���� �� ��������
-- 3. ���� �÷� ��������

-- 4. ��ȣ���� ��������

-- �������� �ۼ� ��ġ�� ���� ����
-- 5. ��Į�� �������� : SELECT ���� �ۼ�
-- 6. �ζ��� �� �������� : FROM ���� �ۼ�