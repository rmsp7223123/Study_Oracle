--JOIN(연산)
--오라클 관계형 데이터베이스==> 테이블과 테이블이 맺는 관계
--Relation - 데이터베이스 설계할 때 테이블을 릴레이션이라고 함
--join 여러 테이블을 연결하여 (HR:7개, 업무: n개)


--Cartesian Product(Decart의 다른말, Cartesian)
--join조건 : 둘 이상의 테이블의 관계를 맺을 때, 기준이 되는 컬럼을 지정 ==> 보통 where절에 기술
--JOIN 조건을 기술하지 않을 때 잘못된 결과가 발생하는데, 이걸 카테시안 곱(=합성곱)이라고 함
--오류는 나지 않음
/*
select 컬럼명1, 컬럼명2, ...
from 테이블명1, 테이블명2, ...
where join 조건(=비교)
*/

--EQUI JOIN  : 동등 연산자(=)를 사용해 JOIN 연산(=동등 조인)
--누락된 데이터 행까지 포함해서 결과를 반영 ==> 제대로 된 결과
SELECT
    e.employee_id,
    e.last_name,
    d.department_name
FROM
    employees   e,
    departments d
WHERE
    e.department_id = d.department_id;

SELECT
    e.employee_id,
    e.first_name
    || ' '
    || e.last_name AS name,
    e.job_id,
    j.job_title
FROM
    employees e,
    jobs      j
WHERE
    e.job_id = j.job_id
ORDER BY
    1;

SELECT
    e.employee_id  AS 사번,
    e.first_name
    || ' '
    || e.last_name AS name,
    d.department_name,
    j.job_title
FROM
    employees   e,
    departments d,
    jobs        j
WHERE
        e.department_id = d.department_id
    AND e.job_id = j.job_id
ORDER BY
    1;

SELECT
    e.employee_id,
    e.first_name,
    d.department_name,
    j.job_title
FROM
    employees   e,
    departments d,
    jobs        j
WHERE
        e.department_id = d.department_id
    AND e.job_id = j.job_id
    AND e.employee_id = 101;

SELECT
    e.employee_id,
    j.job_title
FROM
    employees e,
    jobs      j
WHERE
        e.job_id = j.job_id
    AND e.salary >= j.min_salary
    AND e.salary <= j.max_salary
    AND e.department_id = 10;


--NON_EQUI JOIN

--OUTER JOIN : EQUI JOIN 쿼리문은 JOIN 하는 테이블 간 공통으로 만족되는 값을 가진 경우의 결과만을 반환함.
--             하지만 OUTER JOIN은 만족되는 값이 없는 경우의 결과까지 반환함
--             만족되는 값이 없는 테이블 컬럼명에 (+) 기호를 표시함.  

SELECT
    e.employee_id     AS empno,
    e.first_name      AS ename,
    e.salary          AS esal,
    d.department_name AS dname
FROM
    employees   e,
    departments d
WHERE
    e.department_id = d.department_id;

--SELF JOIN : 하나의 테이블을 두 번 명시하여, 동일한 테이블 두개로부터 JOIN을 통해 데이터를 조회환 결과를 반환함
--테이블이 존재하는 것처럼 JOIN 연산
--테이블 관계 : 순한 참조(재귀, Recursive)

SELECT
    employee_id,
    first_name,
    manager_id
FROM
    employees;

--self join
SELECT
    e.employee_id,
    e.first_name,
    m.employee_id AS manager_id,
    m.first_name  AS manager_name
FROM
    employees e,
    employees m
WHERE
    e.manager_id = m.manager_id
ORDER BY
    1;


--ANSI JOIN