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
    AND e.job_id = j.job_id;


--NON_EQUI JOIN

--OUTER JOIN

--SELF JOIN

--ANSI JOIN