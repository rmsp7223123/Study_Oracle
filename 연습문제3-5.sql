--[연습문제3-5]
--
--1. 사원의 사번, 이름, 업무, 업무등급을 조회하는 쿼리문을 DECODE 함수를 사용하여 작성한다.
--단, 업무 등급은 다음과 같이 적용된다
--
---------------------
--업무        등급
--------------------
--AD_PRES     A
--ST_MAN      B
--IT_PROG     C
--SA_REP      D
--ST_CLERK    E
--기타        X
------------------
SELECT
    employee_id,
    first_name,
    job_id,
    decode(job_id, 'AD_PRES', 'A', 'ST_MAN', 'B',
           'IT_PROG', 'C', 'SA_REP', 'D', 'ST_CLERK',
           'E', 'X') AS job_grade
FROM
    employees
ORDER BY
    4;





--2. 사원의 사번, 이름, 입사일, 근무년수, 근속상태를 조회하는 쿼리문을 작성한다
--단, 근무년수는 오늘 날짜를 기준으로 정수형태로 표기한다  ex> 3.56 ==> 3
--근속상태는 근무년수   3년 미만  '3년 미만'
--                      3년 ~ 5년  '3년근속'
--                      5년 ~ 7년  '5년 근속'
--                      8년 ~ 10년 '7년 근속'
--                      10년~      '10년 이상 근속'

SELECT
    employee_id,
    first_name,
    job_id,
    CASE job_id
        WHEN 'AD_PRES'  THEN
            'A'
        WHEN 'ST_MAN'   THEN
            'B'
        WHEN 'IT_PROG'  THEN
            'C'
        WHEN 'SA_REP'   THEN
            'D'
        WHEN 'ST_CLERK' THEN
            'e'
        ELSE
            'x'
    END AS job_grade
FROM
    employees
ORDER BY
    4;

SELECT
    employee_id,
    first_name,
    hire_date                                             AS 입사년도,
    round(months_between(sysdate, hire_date) / 12)        AS 근무년수,
    to_char(sysdate, 'YYYY') - to_char(hire_date, 'YYYY') AS 근무년수2,
    case when round(months_between(sysdate, hire_date) / 12) >= 10 and round(months_between(sysdate, hire_date) / 12) < 15 then '10년이상 근속'
         when round(months_between(sysdate, hire_date) / 12) >= 15 and round(months_between(sysdate, hire_date) / 12) < 20 then '15년이상 근속'
         when round(months_between(sysdate, hire_date) / 12) >= 20 then '20년이상 근속'
         else '10년미만'
    end as 근속상태
FROM
    employees
ORDER BY
    hire_date ASC;