-- ��������3-2
-- �����Լ�, �����Լ� PART

1. ��� ���̺��� �̸�(first_name)�� A�� �����ϴ� ��� ����� �̸��� �̸��� ���̸� ��ȸ�Ѵ�
SELECT  first_name, LENGTH(first_name) AS name_length
FROM    employees
WHERE   first_name LIKE 'A%'; -- 10 rows

-- LENGTH(char) : �̸�����
-- LIKE ������
-- % : ���� ����
-- _ : �ϳ��� ����
-- _ ��ü�� �ν� , \_     ESCAPE '\' 


/*
FIRST_NAME           NAME_LENGTH
-------------------- -----------
Amit                           4
Alexis                         6
Anthony                        7
Alberto                        7
Adam                           4
Alexander                      9
Alyssa                         6
Alexander                      9
Allan                          5
Alana                          5
*/


2. 80�� �μ����� �̸��� �޿��� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
(��, �޿��� 15�� ����, ���ʿ� $ ��ȣ�� ä���� ���·� ǥ���Ѵ�)
-- LPAD(char, n [,char2])

SELECT  first_name, LPAD(salary, 15, '$') AS salary, '$' || salary AS salary2
FROM    employees
WHERE   department_id = 80; --34 rows



3. 60�� �μ�, 80�� �μ�, 100�� �μ��� �Ҽӵ� ����� ���, �̸�, ��ȭ��ȣ, ��ȭ��ȣ�� ������ȣ�� ��ȸ�Ѵ�
(��, ������ȣ�� Local Number��� ǥ���ϰ�, ������ȣ 515.124.4169���� 515�� ������ȣ�̴�)
-- SUBSTR(char, position [,length])
-- INSTR(char, from_string, to_string [,_th] )

SELECT employee_id, first_name, phone_number, SUBSTR(phone_number, 1, INSTR(phone_number, '.') - 1) AS "Local Number", department_id
FROM    employees
WHERE   department_id IN (60, 80, 100); -- 45 rows
--WHERE   department_id = 60
--OR      department_id = 80
--OR      department_id = 100
--ORDER BY department_id ASC; -- �ظ��ϸ� ORDER BY�� ����, �����ص�~ ���̺��� �⺻������ ������ ������ �ĺ��ڿ� ������ ����
