/* ===================================================
   [�������� 2-1] (p.18)
   �� HR �������� �ǽ��ϼ���!
=================================================== */

1. ����� 200�� ����� �̸��� �μ���ȣ�� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
-- EMPLOYEES ���̺��� EMPLOYEE_ID�� �ĺ���(�� x, �ߺ� x, ������ ��)

desc employees; -- EMPLOYEE_ID    NOT NULL NUMBER(6) 

SELECT  first_name, department_id
FROM    employees
WHERE   employee_id = 200; 
/*
FIRST_NAME           DEPARTMENT_ID
-------------------- -------------
Jennifer                        10
*/


2. �޿��� 3000���� 15000 ���̿� ���Ե��� �ʴ� ����� ���, �̸�, �޿� ������ ��ȸ�ϴ� �������� �ۼ��Ѵ�.
(��, �̸��� ���� �̸��� ���鹮�ڸ� �ξ� ���ļ� ��ȸ�Ѵ�. ������� �̸��� John �̰�, ���� Seo�̸� 
John Seo�� ��ȸ�Ѵ�)
-- BETWEEN �ʱⰪ AND ��������;
-- AND , OR
-- NOT
-- ||
SELECT employee_id, first_name||' '||last_name full_name, salary
FROM    employees
--WHERE   NOT salary BETWEEN 3000 AND 15000;
WHERE   salary NOT BETWEEN 3000 AND 15000; -- 27rows




3. �μ���ȣ 30�� 60�� �Ҽӵ� ����� ���, �̸�, �μ���ȣ, �޿��� ��ȸ�ϴµ� �̸��� ���ĺ� ������ �����Ͽ�
��ȸ�ϴ� �������� �ۼ��Ѵ�.
-- OR
-- IN, NOT IN
-- ORDER BY �÷��� [ASC|DESC]
SELECT  employee_id, first_name, department_id, salary
FROM    employees
WHERE   department_id = 30
OR      department_id = 50
ORDER BY first_name; -- 51rows





4. �޿��� 3000���� 15000 ���̸鼭, �μ���ȣ�� 30 �Ǵ� 60�� �Ҽӵ� ����� ���, �̸�, �޿��� ��ȸ�ϴ�
�������� �ۼ��Ѵ�(��, ��ȸ�Ǵ� �÷����� ���� �̸��� ������ �ξ� ���� name����, �޿��� Monthly Salary��)
SELECT  employee_id, last_name||' '||first_name AS name, salary AS "Monthly Salary", department_id
FROM    employees
WHERE   salary BETWEEN 3000 AND 15000
AND     department_id IN (30, 60); -- 7rows



5. �Ҽӵ� �μ���ȣ�� ���� ����� ���, �̸�, ����ID�� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
-- �����Ͱ� ����, ����ִ� ==> NULL
SELECT  employee_id, last_name||' '||first_name AS name, job_id
FROM    employees
--WHERE   department_id = ' '; -- NULL�� �񱳴���� �ƴ�
WHERE   department_id IS NULL; -- �Ҽӵ� �μ���ȣ�� ����==> �μ��ڵ� ==> NULL : 1rows


6. Ŀ�̼��� �޴� ����� ���, �̸�, �޿�, Ŀ�̼��� ��ȸ�ϴµ� Ŀ�̼��� ���� ������� ���� ��� ������
�����Ͽ� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
-- ORDER BY
-- commission_pct
--  �÷���ȣ :  1        ,    2                       ,   3    ,  4
SELECT  employee_id, last_name||' '||first_name AS name, salary, commission_pct AS comm_pct
FROM    employees
WHERE   commission_pct IS NOT NULL
ORDER BY comm_pct DESC; -- 35rows



7. �̸��� ���� z�� ���Ե� ����� ����� �̸��� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
-- LIKE 
SELECT  employee_id, last_name||' '||first_name AS name
FROM    employees
--WHERE   name LIKE '%z%';
-- WHERE ���� Alias(��Ī, ���) ��� : X 
-- ORA-00904: "NAME": �������� �ĺ���
-- 00904. 00000 -  "%s: invalid identifier"
WHERE   last_name||' '||first_name LIKE '%z%';