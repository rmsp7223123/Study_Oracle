-- 8�� DML
-- select : ������ ��ȸ
-- insert : �� �����͸� �����ϴ� ���
-- update : ���� �����͸� �����ؼ� �����ϴ� ���
-- delete : ���� �����͸� �����ϴ� ���


--insert
--������ ���� ��� ==> ���̺� ����
--isert into ���̺��[�÷���, �÷���2, ...] �÷��� ������ ������ ���Ѿ���
--values (��, ��2, ...) �÷� ������ ���� ����, Ÿ��(=�ڷ���) / ��ȯ�Լ�

--�����͸� ���� �� �÷� ��ϰ� �ϴ��� �����ǵ��� ���� �� ����� values�� ������
--�������� �ʴ� �÷����� �ڵ����� NULL���� �����
--��¥ �����ʹ� ��¥ ���� ������ ����ؼ� ������ �� ����

CREATE TABLE emp (
    emp_id    NUMBER,
    fname     VARCHAR2(30),
    lname     VARCHAR2(30),
    hire_date DATE DEFAULT sysdate,
    job_id    VARCHAR2(20),
    salary    NUMBER(9, 2),
    comm_pct  NUMBER(3, 2),
    dept_id   NUMBER(3)
);

INSERT INTO emp (
    emp_id,
    fname,
    lname,
    hire_date
) VALUES (
    300,
    'Steve',
    'Jobs',
    sysdate
);

INSERT INTO emp (
    emp_id,
    fname,
    lname,
    hire_date
) VALUES (
    301,
    'Bill',
    'Gates',
    sysdate
);

SELECT
    *
FROM
    emp;

ROLLBACK;

INSERT INTO emp (
    emp_id,
    fname,
    lname,
    hire_date,
    job_id,
    salary
) VALUES (
    302,
    'Warren',
    'Buffet',
    sysdate,
    '',
    ''
);

COMMIT;

-- values �� ���� select���� ����� ���������� ���̺�κ��� ���� ������ ���� ����, ���� �� �� ����
-- insert���� ���� �� �÷� ��ϰ� select���� �÷� ����� ������ ��ġ�ؾ� ��.

INSERT INTO emp (
    emp_id,
    fname,
    lname,
    hire_date,
    job_id,
    dept_id
)
    SELECT
        employee_id,
        first_name,
        last_name,
        hire_date,
        job_id,
        department_id
    FROM
        employees
    WHERE
        department_id IN ( 10, 20 );

CREATE TABLE month_salary (
    dept_id   NUMBER(3),
    emp_count NUMBER,
    sum_sal   NUMBER,
    avg_sal   NUMBER(9, 2)
);

INSERT INTO month_salary (
    dept_id,
    emp_count,
    sum_sal,
    avg_sal
)
    SELECT
        department_id,
        COUNT(*),
        SUM(salary),
        round(AVG(salary),
              2)
    FROM
        employees
    WHERE
        department_id IS NOT NULL
    GROUP BY
        department_id
    ORDER BY
        1;

SELECT
    *
FROM
    month_salary;

INSERT INTO emp
    SELECT
        employee_id,
        first_name,
        last_name,
        hire_date,
        job_id,
        salary,
        commission_pct,
        department_id
    FROM
        employees
    WHERE
        department_id BETWEEN 30 AND 60;




--������ ���� udpate
--insert : �� ������ ����
--update : ���� �����͸� �����ؼ� ����

UPDATE emp
SET
    dept_id = 20
WHERE
    emp_id >= 300;

SELECT
    *
FROM
    emp;

COMMIT;

UPDATE emp
SET
    salary = 2000,
    comm_pct = 0.1,
    job_id = 'IT_PROG'
WHERE
    emp_id = 300;

UPDATE emp
SET
    salary = (
        SELECT
            MAX(salary)
        FROM
            employees
        WHERE
            department_id = 20
    )
WHERE
    emp_id = 103;

UPDATE emp
SET
    salary = (
        SELECT
            round(AVG(salary))
        FROM
            employees
        WHERE
            department_id = 50
    )
WHERE
    to_char(hire_date, 'YYYY') = (
        SELECT
            to_char(hire_date, 'YYYY')
        FROM
            emp
        WHERE
            emp_id = 180
    );

CREATE TABLE month_salary2 (
    dept_id   NUMBER(3),
    emp_count NUMBER,
    sum_sal   NUMBER,
    avg_sal   NUMBER(9, 2)
);

INSERT INTO month_salary2 ( dept_id )
    SELECT
        department_id
    FROM
        employees
    WHERE
        department_id IS NOT NULL
    GROUP BY
        department_id;

DROP TABLE month_salary2;

SELECT
    *
FROM
    month_salary2;

COMMIT;

UPDATE month_salary2 m
SET
    emp_count = (
        SELECT
            COUNT(*)
        FROM
            employees e
        WHERE
            e.department_id = m.dept_id
        GROUP BY
            department_id
    ),
    sum_sal = (
        SELECT
            SUM(e.salary)
        FROM
            employees e
        WHERE
            e.department_id = m.dept_id
    ),
    avg_sal = (
        SELECT
            AVG(e.salary)
        FROM
            employees e
        WHERE
            e.department_id = m.dept_id
    );

COMMIT;

UPDATE month_salary2 m
SET
    ( emp_count,
      sum_sal,
      avg_sal ) = (
        SELECT
            COUNT(employee_id),
            SUM(salary),
            AVG(salary)
        FROM
            employees e
        where
            e.department_id = m.dept_id
        GROUP BY
            department_id
    );
    
commit;

--8.3 ������ ���� delete
--���̺� �� �����͸� �����ϴ� �⺻ ����
--where ���� ���ǿ� ��ġ�ϴ� �� �����͸� �����Ѵ�

delete from emp where dept_id = 60;
select * from emp;