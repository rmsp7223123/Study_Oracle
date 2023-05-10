--[��������3-5]
--
--1. ����� ���, �̸�, ����, ��������� ��ȸ�ϴ� �������� DECODE �Լ��� ����Ͽ� �ۼ��Ѵ�.
--��, ���� ����� ������ ���� ����ȴ�
--
---------------------
--����        ���
--------------------
--AD_PRES     A
--ST_MAN      B
--IT_PROG     C
--SA_REP      D
--ST_CLERK    E
--��Ÿ        X
------------------
SELECT
    employee_id,
    first_name,
    job_id,
    decode(job_id, 'AD_PRES', 'A', 'ST_MAN', 'B',
           'IT_PROG', 'C', 'SA_REP', 'D', 'ST_CLERK',
           'E', 'X') AS job_grade
FROM
    employees
ORDER BY
    4;





--2. ����� ���, �̸�, �Ի���, �ٹ����, �ټӻ��¸� ��ȸ�ϴ� �������� �ۼ��Ѵ�
--��, �ٹ������ ���� ��¥�� �������� �������·� ǥ���Ѵ�  ex> 3.56 ==> 3
--�ټӻ��´� �ٹ����   3�� �̸�  '3�� �̸�'
--                      3�� ~ 5��  '3��ټ�'
--                      5�� ~ 7��  '5�� �ټ�'
--                      8�� ~ 10�� '7�� �ټ�'
--                      10��~      '10�� �̻� �ټ�'

SELECT
    employee_id,
    first_name,
    job_id,
    CASE job_id
        WHEN 'AD_PRES'  THEN
            'A'
        WHEN 'ST_MAN'   THEN
            'B'
        WHEN 'IT_PROG'  THEN
            'C'
        WHEN 'SA_REP'   THEN
            'D'
        WHEN 'ST_CLERK' THEN
            'e'
        ELSE
            'x'
    END AS job_grade
FROM
    employees
ORDER BY
    4;

SELECT
    employee_id,
    first_name,
    hire_date                                             AS �Ի�⵵,
    round(months_between(sysdate, hire_date) / 12)        AS �ٹ����,
    to_char(sysdate, 'YYYY') - to_char(hire_date, 'YYYY') AS �ٹ����2,
    case when round(months_between(sysdate, hire_date) / 12) >= 10 and round(months_between(sysdate, hire_date) / 12) < 15 then '10���̻� �ټ�'
         when round(months_between(sysdate, hire_date) / 12) >= 15 and round(months_between(sysdate, hire_date) / 12) < 20 then '15���̻� �ټ�'
         when round(months_between(sysdate, hire_date) / 12) >= 20 then '20���̻� �ټ�'
         else '10��̸�'
    end as �ټӻ���
FROM
    employees
ORDER BY
    hire_date ASC;