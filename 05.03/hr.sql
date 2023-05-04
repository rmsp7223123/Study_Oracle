desc regions;
desc countries;

SELECT
    *
FROM
    employees;

SELECT
    *
FROM
    countries;

SELECT
    *
FROM
    job_history;

SELECT
    *
FROM
    jobs;

SELECT
    *
FROM
    locations;

SELECT
    *
FROM
    regions;

SELECT
    *
FROM
    departments;

--���̺� ����
--����Ŭ(=�����ͺ��̽� ���� �ý���)�� �����͸� 2���� ����(ǥ, table�� ��� ��)�� �⺻������ ����
--���̺� : � ������ �ִµ� <--> �����ͺ��̽� : ����(Relation)
--ex> (ȸ��)�μ� ���� ���̺�, ��� ���� ���̺�
--Document : ��, �� ������ �ƴ� vs RDBMS : ���̺�(��, ��)

--�鿭(Column) : ���ι���
--�̸�          ��?       ����           <---- ��(ROW), ���ι���
------------- -------- ------------ 
--REGION_ID   NOT NULL NUMBER       
--REGION_NAME          VARCHAR2(25) 



--DESC / DESCRIBE : ���̺��� ���� ==> �� �̸�, �ڷ���, (������ �� �ִ� ������) ���� Ȯ��
--    SELECT : �����͸� ��ȸ ==> ���̺��� ���ڵ� (ROW �Ǵ� Tuple/Ʃ��)

SELECT
    * -- select ��
-- * : �ֽ��͸���ũ , ALL(����÷�)
FROM
    employees; -- from ��


--������
--�ʿ��� ������ ��ȸ�ϱ� ���� ����, ������ ���͸�

--SELECT �� �̸�1, ���̸�2, ���̸�3,...
--FROM ���̺� ��;

SELECT
    *
FROM
    employees
WHERE
    department_id = 80;
--����Ŭ ������ = : ����(����X)

SELECT
    *
FROM
    departments
WHERE
    department_id = 80;

SELECT
    department_id,
    department_name,
    location_id
FROM
    departments
WHERE
    department_name = 'sales'; -- ���ڴ� '�� �ۼ�, ��/�ҹ��ڸ� ����[��¥ �����͵� '��]

SELECT
    department_id,
    department_name,
    location_id
FROM
    departments
WHERE
    department_id = 80;

/*
    WHERE�������� �����ϴ� �׸��� �з�
    1)�÷�, ����, ����
    2)���������(+, -, *, /), �񱳿�����(=,<=,<,>,>=, !=, <>, ^=),  --MOD(����, ������) : % ��� ����ϴ� �Լ�
    3)AND, OR, NOT
    4)LIKE, IN, BETWEEN, EXISTS
    5)IS NULL, IS NOT NULL
    6)ANY, SOME, ALL
    7)�Լ�
    
    
    ������
    1)��������� : +, -, *, /
    MOD(����, ������) : %��� ����ϴ� �Լ�
    ��������ڴ� SELECT ��ϰ� �������� ����� ����
    
    
*/

SELECT
    2 + 2 "��"
FROM
    dual;
-- ���� �������� �ʴ� ���̺�DUAL, �ܼ��� ��������̳� �ý��� ��¥ ����ϰų� �Լ��� ����, ��ȯ�� Ȯ��

SELECT
    5 - 2 AS ��
FROM
    dual;
-- ������ DB������ �⺻������ ����Ŭ ��ü��(=���̺�) �빮�ڷ� �ۼ��ϴµ�,
-- �ҹ��ڷ� ���̺���� �ۼ��Ϸ��� ������ �� "�ҹ���"�� ����� ó��

SELECT
    5 * 5 AS ��,
    2 - 1 AS ��,
    2 / 3 ��
FROM
    dual;


--WHERE ������
SELECT
    *
FROM
    employees
WHERE
    salary * 12 > 100000;

SELECT
    employee_id AS ���,
    last_name   AS ��,
    first_name  AS �̸�,
    salary * 12
FROM
    employees
WHERE
    department_id = 80;

SELECT
    employee_id AS ���,
    last_name   AS ��,
    first_name  AS �̸�,
    salary * 12
    || ''
    || '$'      AS ����,
    department_id
FROM
    employees
WHERE
    salary * 12 = 120000;

--���ڿ� ���� ������ : ||
--���ڿ� ���� �Լ� : CONCAT()
--���� ������, ���� ������ : '�� ����

SELECT
    employee_id   AS ���,
    last_name
    || ' '
    || first_name AS ����,
    salary * 12
    || ''
    || '$'        AS ����,
    department_id,
    job_id
FROM
    employees
WHERE
    employee_id = 101;

SELECT
    department_name
FROM
    departments
WHERE
    department_id = 90;
    
-- �÷��� ��Ī(Alias) : �÷��� ��Ī, �� �ٿ� ����� �� ����.
--1) �÷���(����) ��Ī : ' '
--2) Ű���� AS �Ǵ� as ��� -- ������ ���鿡���� select ���� ���������� as�� �߰��ϴ°��
--3) ū ����ǥ�� ��� �� �� ����(�������), �� �÷��� ������ ������ ��쿣 �ݵ�� ū����ǥ�� �������
SELECT
    employee_id AS ���,
    last_name   ��,
    salary * 12 AS ����
FROM
    employees
WHERE
    employee_id = 101;

--�񱳿�����
--���� ũ�⸦ �� : =, >=, >, <, <=
SELECT
    employee_id,
    last_name,
    salary,
    department_id
FROM
    employees
WHERE
    salary <= 3000;

SELECT
    *
FROM
    employees
WHERE
    department_id > 80;

SELECT
    *
FROM
    departments;

SELECT
    *
FROM
    employees
WHERE
    last_name = 'Chen';

SELECT 'hanul' as
    employee_id,
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date > '05/09/28';
    
select *
from employees
where last_name = 'King';

select *
from employees
where hire_date < '04/01/01';