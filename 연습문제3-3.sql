[��������3-3]

1. ��� ���̺��� 30�� �μ����� ���, ����, �޿�, �ٹ� ���� ���� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
(��, �ٹ� ���� ���� ���� ��¥�� �������� ��¥ �Լ��� ����Ͽ� ����Ѵ�)
-- ��¥ �Լ�
-- 1.������ n ���� ��¥ ��ȯ : ADD_MONTHS(date, n)
-- 2.�� ��¥ ������ �������� ���, ��ȯ : MONTHS_BETWEEN(date1, date2) / date1:���� ��¥

-- 3. ���ϴ� �÷� ��ȸ
-- ����, �ݿø� �Լ� ==> �Ҽ��� ù° �ڸ� or ���� ó��
SELECT  employee_id, first_name, salary, 
        ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) AS "�ٹ� ���� ��1",
        TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)) AS "�ٹ� ���� ��2",
        TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date) / 12) AS "�ٹ� ���"
FROM    employees -- 1. ���̺��� ���� ã�´�.
WHERE   department_id = 30; -- 2. ���͸�, 6rows






2. �޿��� 12000 �޷� �̻��� ����� ���, ����, �޿��� ��ȸ�Ͽ� �޿� ������ ����� �����Ѵ�.
(��, �޿��� õ���� ���� ��ȣ�� ����Ͽ� ǥ���ϵ��� �Ѵ�)
-- p.31  TO_CHAR(number [,fmt])
-- , : õ ���� ǥ��
-- 9 : ���� �ϳ� ǥ��
-- $ : �޷� ǥ��
-- L : ����(=����) ��ȭ��ȣ ǥ��(WON, YEN, ....)
SELECT  employee_id, first_name||' '||last_name AS name, LTRIM(TO_CHAR(salary, '99,999')) AS salary
FROM    employees
WHERE   salary >= 12000 -- 9rows
ORDER BY salary DESC;




3. 2005�� ������ �Ի��� ������� ���, ����, �Ի���, ���� ���� ������ ��ȸ�ϴ� �������� �ۼ��Ѵ�.
(��, ���� ���� �����̶� �Ի��Ͽ� �ش��ϴ� ������ �����Ѵ�)
-- TO_CHAR(date, 'YYYY') : �⵵ 4�ڸ����� ���ڷ� ��ȯ�Ͽ� ��ȯ�ϴ� �Լ�
-- 2004�� 12�� 31�� ����
-- 2005�� 1�� 1�� �̸�
-- NEXT_DAY(date, '��������') : ���ƿ��� ���� ��ȯ�ϴ� �Լ�
-- LAST_DAY(date) : date�� �޿� ������ ���ڸ� ��ȯ�ϴ� �Լ�

SELECT  employee_id, first_name||' '||last_name AS name, hire_date, 
        TO_CHAR(hire_date, 'DAY') AS "���� ���� ����1",
        TO_CHAR(hire_date, 'DY') AS "���� ���� ����2"
FROM    employees
--WHERE   hire_date < '2005-12-31'; -- ������ ����ȯ
WHERE   TO_CHAR(hire_date, 'YYYY') < '2005' -- ����� ����ȯ, 24rows
ORDER BY 3 DESC;

desc employees;
-- HIRE_DATE      NOT NULL DATE   : DATE (��¥ ���� �÷�)

-- ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';




