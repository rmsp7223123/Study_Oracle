[��������3-4]

1. ����� ���, �̸�, �μ�, �Ŵ�����ȣ�� ��ȸ�ϴ� �������� �ۼ��Ѵ�
(��, �Ŵ����� �ִ� ����� �Ŵ���, �Ŵ����� ���� ����� No Manager�� ǥ���ϵ��� �Ѵ�)
--
SELECT
    employee_id, department_id, NVL2(manager_id, 'Manager', 'No Manager') AS manager
FROM
    employees;