[��������4-3]

1. ������̺��� �Ȱ��� �̸��� �� �̻� �ִ� �̸��� �� �̸��� ��� ��������� ��ȸ�Ѵ�
-- John, Peter, Davin : ���� �̸�!
SELECT first_name, COUNT(*) AS cnt
FROM    employees
GROUP BY    first_name
HAVING  COUNT(*) >= 2
ORDER BY 2 DESC; -- 13rows



2. �μ���ȣ, �� �μ��� �޿��Ѿװ� ��ձ޿��� ��ȸ�ϴ� �������� �ۼ��Ѵ�
(��, �μ� ��ձ޿��� 8000 �̻��� �μ��� ��ȸ)

SELECT  department_id, SUM(salary) AS sum_sal, ROUND(AVG(salary)) AS avg_sal
FROM    employees
GROUP BY    department_id
HAVING  ROUND(AVG(salary)) >= 8000
ORDER BY 3; -- 6rows



3. �⵵, �⵵���� �Ի��� ������� ��ȸ�ϴ� �������� �ۼ��Ѵ�
(��, �⵵�� 2014�� ���·� ǥ��ǵ��� �Ѵ�)

SELECT TO_CHAR(hire_date, 'YYYY') AS YEAR, COUNT(*)
FROM    employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY 1;  -- 8rows

