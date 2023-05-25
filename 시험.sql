--  13번

CREATE TABLE dept (
    deptno NUMBER(5) PRIMARY KEY,
    dname  NVARCHAR2(30),
    city   NVARCHAR2(30)
);

INSERT INTO dept VALUES (
    10,
    'Accounting',
    'New York'
);

INSERT INTO dept VALUES (
    20,
    'Research',
    'Dallas'
);

INSERT INTO dept VALUES (
    30,
    'Sales',
    'Chicago'
);

SELECT
    *
FROM
    dept;

COMMIT;

-- 14번

CREATE TABLE emp (
    empno     NUMBER(8) PRIMARY KEY,
    name      NVARCHAR2(10),
    job       NVARCHAR2(20),
    hire_date NVARCHAR2(20),
    salary    NUMBER(8),
    deptno    NUMBER(5)
);

INSERT INTO emp VALUES (
    200103,
    'Jones',
    'Manager',
    '2001-04-02',
    2975,
    20
);

INSERT INTO emp VALUES (
    200104,
    'Blake',
    'Manager',
    '2001-05-01',
    2850,
    30
);

INSERT INTO emp VALUES (
    200105,
    'Clark',
    'Manager',
    '2001-06-09',
    2450,
    10
);

INSERT INTO emp VALUES (
    200106,
    'King',
    'President',
    '2001-11-17',
    5000,
    10
);

INSERT INTO emp VALUES (
    200201,
    'Miller',
    'Clerk',
    '2002-01-23',
    1300,
    10
);

INSERT INTO emp VALUES (
    200202,
    'Allen',
    'Salesman',
    '2002-02-20',
    1600,
    30
);

INSERT INTO emp VALUES (
    200203,
    'Ford',
    'Analyst',
    '2002-12-03',
    3000,
    20
);

INSERT INTO emp VALUES (
    200701,
    'Adams',
    'Clerk',
    '2007-02-23',
    1100,
    20
);

INSERT INTO emp VALUES (
    200702,
    'Ward',
    'Salesman',
    '2007-05-22',
    1250,
    30
);

INSERT INTO emp VALUES (
    200703,
    'James',
    'Clerk',
    '2007-12-03',
    950,
    30
);

SELECT
    name,
    salary,
    deptno,
    hire_date
FROM
    emp
WHERE
    hire_date LIKE '2001%'
ORDER BY
    hire_date DESC;

COMMIT;

-- 15번

SELECT
    empno,
    name,
    deptno,
    salary
FROM
    emp
WHERE
    deptno = 10
    OR deptno = 20
ORDER BY
    deptno,
    salary DESC;


-- 16번

SELECT
    e.name,
    e.salary,
    d.dname
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno;


-- 17번

SELECT
    deptno   AS 부서번호,
    round(AVG(salary),
          2) AS 부서평균급여
FROM
    emp
GROUP BY
    deptno;

-- 18번

INSERT INTO emp VALUES (
    201701,
    'Bill',
    'Clerk',
    '2017-10-12',
    1000,
    20
);

SELECT
    *
FROM
    emp;

COMMIT;

-- 19번

UPDATE emp
SET
    salary = 1400
WHERE
    job = 'Clerk';

SELECT
    *
FROM
    emp;

COMMIT;

-- 20번

DELETE FROM emp
WHERE
    salary = (
        SELECT
            MAX(salary)
        FROM
            emp
    );

SELECT
    *
FROM
    emp;

COMMIT;