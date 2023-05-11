--4장 그룹함수
--그룹지어서, 그룹별로 데이터를 조회

--DISTINCT : 중복을 제거한 결과를 반환하는 함수 --> SYSDATE처럼 파라미터가 없음
--    DISTINCT 컬럼명1, 컬럼명2, ... : 모든 컬럼에(중복제거) 적용됨
--    NULL은 제거 X

-- 컬럼끼리 조합해서 중복을 제거 ==> _ID : 식별자(중복되지 않는 유일한 값, NULL 허용x)
SELECT DISTINCT
    department_id,
    employee_id
FROM
    employees
WHERE
    department_id IS NOT NULL;


--COUNT() : 데이터 행이 몇 건 존재하는지 개수를 세어서 반환하는 함수
--데이터가 null인 행은 제외됨

SELECT
    COUNT(*),
    COUNT(employee_id),
    COUNT(department_id),
    COUNT(DISTINCT department_id)
FROM
    employees;


--SUM() : 숫자 데이터 컬럼의 전체 합계를 계산하여 그 결과를 반환하는 함수
--데이터는 미국기준, salary는 $기준

SELECT
    to_char(SUM(salary),
            'L999,999')
    || '$'           AS 급여총합,
    to_char(round(SUM(salary) / COUNT(employee_id),
                  0),
            '9,999') AS 급여평균
FROM
    employees;


--MAX() : 데이터 컬럼에서 가장 큰 값을 반환하는 함수
--MIN() : 데이터 컬럼에서 가작 작은 값을 반환하는 함수
--모든 데이터 유형을 사용


SELECT
    MAX(salary) AS 최고급여액,
    MIN(salary) AS 최저급여액
FROM
    employees;
    
select employee_id, first_name||' '||last_name as name, job_id, salary
from employees
where salary in (24000,2100);

select *
from job_history;

select *
from jobs;

select max(hire_date), min(hire_date), max(commission_pct), min(commission_pct)
from employees
where commission_pct is not null;


--AVG() : 숫자데이터 컬럼의 