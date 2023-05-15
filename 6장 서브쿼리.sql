--6장 서브쿼리

--SQL문장 안에 존재하는 또다른 SQL문장(SELECT ~ FROM~ WHERE)을 서브쿼리라고 한다
--서브쿼리는 괄호(, ) 로 묶어서 사용
--서브쿼리가 포함된 쿼리문을 메인 쿼리라고 함.

--서브쿼리 사용 예
SELECT
    round(AVG(salary)) AS avg_sal
FROM
    employees;

SELECT
    employee_id,
    first_name,
    salary,
    department_id
FROM
    employees
WHERE
    salary < (
        SELECT
            round(AVG(salary)) AS avg_sal
        FROM
            employees
    );

SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary > (
        SELECT
            salary
        FROM
            employees
        WHERE
            employee_id = 108
    );



--      ======서브쿼리의 유형======
-- 서브쿼리 실행 결과 개수에 따른 구분
-- 1. 단일 행 서브쿼리 : 하나의 결과 행을 반환하는 서브쿼리
--    └단일 행 연산자(=, >=, <=, >, <,      <>, !=, ^=)
--    └그룹함수를 사용하는 경우가 많음 (AVG, SUM, COUNt, MAX, MIN)

SELECT
    salary
FROM
    employees
ORDER BY
    1 DESC;

SELECT
    MAX(salary) AS max_sal,
    MIN(salary) AS min_sal
FROM
    employees;

SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees
WHERE
    salary = 24000;


-- 2. 다중 행 서브쿼리
-- 3. 다중 컬럼 서브쿼리

-- 4. 상호연관 서브쿼리

-- 서브쿼리 작성 위치에 따른 구분
-- 5. 스칼라 서브쿼리 : SELECT 절에 작성
-- 6. 인라인 뷰 서브쿼리 : FROM 절에 작성