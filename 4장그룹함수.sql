--4�� �׷��Լ�
--�׷����, �׷캰�� �����͸� ��ȸ

--DISTINCT : �ߺ��� ������ ����� ��ȯ�ϴ� �Լ� --> SYSDATEó�� �Ķ���Ͱ� ����
--    DISTINCT �÷���1, �÷���2, ... : ��� �÷���(�ߺ�����) �����
--    NULL�� ���� X

-- �÷����� �����ؼ� �ߺ��� ���� ==> _ID : �ĺ���(�ߺ����� �ʴ� ������ ��, NULL ���x)
SELECT DISTINCT
    department_id,
    employee_id
FROM
    employees
WHERE
    department_id IS NOT NULL;


--COUNT() : ������ ���� �� �� �����ϴ��� ������ ��� ��ȯ�ϴ� �Լ�
--�����Ͱ� null�� ���� ���ܵ�

SELECT
    COUNT(*),
    COUNT(employee_id),
    COUNT(department_id),
    COUNT(DISTINCT department_id)
FROM
    employees;


--SUM() : ���� ������ �÷��� ��ü �հ踦 ����Ͽ� �� ����� ��ȯ�ϴ� �Լ�
--�����ʹ� �̱�����, salary�� $����

SELECT
    to_char(SUM(salary),
            'L999,999')
    || '$'           AS �޿�����,
    to_char(round(SUM(salary) / COUNT(employee_id),
                  0),
            '9,999') AS �޿����
FROM
    employees;


--MAX() : ������ �÷����� ���� ū ���� ��ȯ�ϴ� �Լ�
--MIN() : ������ �÷����� ���� ���� ���� ��ȯ�ϴ� �Լ�
--��� ������ ������ ���


SELECT
    MAX(salary) AS �ְ�޿���,
    MIN(salary) AS �����޿���
FROM
    employees;
    
select employee_id, first_name||' '||last_name as name, job_id, salary
from employees
where salary in (24000,2100);

select *
from job_history;

select *
from jobs;

select max(hire_date), min(hire_date), max(commission_pct), min(commission_pct)
from employees
where commission_pct is not null;


--AVG() : ���ڵ����� �÷��� 