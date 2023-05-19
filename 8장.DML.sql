-- 8장 DML
-- select : 데이터 조회
-- insert : 새 데이터를 저장하는 명령
-- update : 기존 데이터를 변경해서 저장하는 명령
-- delete : 기존 데이터를 삭제하는 명령


--insert
--데이터 삽입 명령 ==> 테이블에 삽입
--isert into 테이블명[컬럼명, 컬럼명2, ...] 컬럼명 생략시 순서를 지켜야함
--values (값, 값2, ...) 컬럼 개수와 값의 개수, 타입(=자료형) / 변환함수

--데이터를 저장 할 컬럼 목록과 일대일 대응되도록 저장 값 목록을 values에 나열함
--저장하지 않는 컬럼값은 자동으로 NULL으로 저장됨
--날짜 데이터는 날짜 포맷 형식을 사용해서 저장할 수 있음

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

-- values 절 없이 select문을 사용해 서브쿼리로 테이블로부터 여러 데이터 행을 복사, 저장 할 수 있음
-- insert절의 저장 할 컬럼 목록과 select절의 컬럼 목록의 개수가 일치해야 함.

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




--데이터 변경 udpate
--insert : 새 데이터 삽입
--update : 기존 데이터를 변경해서 저장

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

--8.3 데이터 삭제 delete
--테이블 행 데이터를 삭제하는 기본 문법
--where 절의 조건에 일치하는 행 데이터를 삭제한다

delete from emp where dept_id = 60;
select * from emp;