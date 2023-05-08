--기본적으로 해당 테이블의 식별자(=유일하게, 중복되지 않는 데이터를 구분하는 어떤 값)
SELECT
    *
FROM
    employees
ORDER BY
    컬럼명 [asc|desc]; -- [] : 옵션 , asc(=기본값)
--asc : ascending / 오름차순
--desc : descending / 내림차순

--desc or describe : 테이블의 구조 조회(=테이블의 컬럼 정의, 자료형, 길이값)
--정렬 : select 구문 이하에서 조회된 결과의 특정 컬럼을 기준으로 값을 오름차순, 내림차순 정렬

SELECT
    *
FROM
    employees
WHERE
    department_id = 80
ORDER BY
    first_name DESC; --내림차순


-- 1
SELECT
    last_name || ' '
                 || first_name name,
    department_id
FROM
    employees
WHERE
    employee_id = 200;


-- 2
SELECT
    last_name || ' '
                 || first_name name,
    employee_id,
    salary
FROM
    employees
WHERE
    salary not between 3000 and 15000;


-- 3
SELECT
    last_name || ' '
                 || first_name name,
    employee_id,
    salary,
    department_id
from
    employees
where
    department_id in(30,60)
order by last_name
asc;


-- 4
SELECT
    last_name || ' '
                 || first_name name,
    employee_id,
    salary        AS monthly_salary,
    department_id
FROM
    employees
WHERE
    department_id IN ( 30, 60 )
    AND salary BETWEEN 3000 AND 15000;


-- 5
SELECT
    last_name || ' '
                 || first_name name,
    employee_id,
    salary,
    employee_id,
    department_id
FROM
    employees
WHERE
    department_id IS NULL;


-- 6
SELECT
    last_name || ' '
                 || first_name name,
    employee_id,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct IS NOT NULL
ORDER BY
    commission_pct DESC;


-- 7
SELECT
    last_name || ' '
                 || first_name name,
    employee_id
FROM
    employees
WHERE
    last_name LIKE '%z%';
    
select *
from employees
order by last_name ASC, salary desc;