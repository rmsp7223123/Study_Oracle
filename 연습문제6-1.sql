[��������6-2]


1. �޿��� ���� ����~ ����� ���, �̸�, �μ�(��), �޿��� ��ȸ�Ѵ�.

SELECT  e.employee_id, e.first_name, e.last_name,
        d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id
AND     salary = ( SELECT MIN(salary) AS max_sal
                    FROM    employees ); -- �����޿��� TJ Olson�� ���(=����) �μ��̴�.



2. �μ��� Marketing�� �μ��� ���� ��� ����� ���, �̸�, �μ��ڵ�, �����ڵ带 ��ȸ�ϴ� ������
�ۼ��Ѵ�.
SELECT  department_id
FROM    departments
WHERE   department_name = 'Marketing'; -- 1rows, 20(��)


-- ��������
SELECT  employee_id, first_name, department_id, job_id
FROM    employees   
WHERE   department_id = ( SELECT  department_id
                          FROM    departments
                          WHERE   department_name = 'Marketing' ); -- 2rows


3. ȸ���� ���庸�� �� ���� �Ի��� ������� ���, �̸�, �Ի����� ��ȸ�ϴ� �������� �ۼ�
-- ������ �׸� �����ϴ� �Ŵ����� ���� ����̴�.
-- 3.1 ������ �Ի��� ��ȸ
SELECT  hire_date
FROM    employees
WHERE   manager_id IS NULL; -- NULL �񱳴�� x ==> IS NULL or IS NOT NULL �ƴϸ� NULL ó��!!
-- 03/06/17

-- 3.2 �Ի����� ���ؼ� �� ����(�Ի����� �� ���� ==> �̸�..)
--�÷���ȣ:  1     ,     2     ,    3
SELECT  employee_id, first_name, hire_date
FROM    employees
WHERE   hire_date < ( SELECT  hire_date
                      FROM    employees
                      WHERE   manager_id IS NULL ) -- 10 rows
ORDER BY 3;                      


-- ���������� WHERE ���� ���� ���� ����Ѵ�!







