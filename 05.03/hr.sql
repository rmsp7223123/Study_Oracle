desc regions;
desc countries;

SELECT
    *
FROM
    employees;

SELECT
    *
FROM
    countries;

SELECT
    *
FROM
    job_history;

SELECT
    *
FROM
    jobs;

SELECT
    *
FROM
    locations;

SELECT
    *
FROM
    regions;

SELECT
    *
FROM
    departments;

--테이블 구조
--오라클(=데이터베이스 관리 시스템)이 데이터를 2차원 구조(표, table의 행과 열)로 기본적으로 저장
--테이블 : 어떤 정보가 있는데 <--> 데이터베이스 : 관계(Relation)
--ex> (회사)부서 정보 테이블, 사원 정보 테이블
--Document : 행, 열 구조가 아님 vs RDBMS : 테이블(행, 열)

--↓열(Column) : 가로방향
--이름          널?       유형           <---- 행(ROW), 세로방향
------------- -------- ------------ 
--REGION_ID   NOT NULL NUMBER       
--REGION_NAME          VARCHAR2(25) 



--DESC / DESCRIBE : 테이블의 구조 ==> 열 이름, 자료형, (져장할 수 있는 데이터) 길이 확인
--    SELECT : 데이터를 조회 ==> 테이블의 레코드 (ROW 또는 Tuple/튜플)

SELECT
    * -- select 절
-- * : 애스터리스크 , ALL(모든컬럼)
FROM
    employees; -- from 절


--조건절
--필요한 정보만 조회하기 위한 구문, 일종의 필터링

--SELECT 열 이름1, 열이름2, 열이름3,...
--FROM 테이블 명;

SELECT
    *
FROM
    employees
WHERE
    department_id = 80;
--오라클 연산자 = : 같다(대입X)

SELECT
    *
FROM
    departments
WHERE
    department_id = 80;

SELECT
    department_id,
    department_name,
    location_id
FROM
    departments
WHERE
    department_name = 'sales'; -- 문자는 '로 작성, 대/소문자를 구분[날짜 데이터도 '로]

SELECT
    department_id,
    department_name,
    location_id
FROM
    departments
WHERE
    department_id = 80;

/*
    WHERE조건절을 구성하는 항목의 분류
    1)컬럼, 숫자, 문자
    2)산술연산자(+, -, *, /), 비교연산자(=,<=,<,>,>=, !=, <>, ^=),  --MOD(젯수, 피젯수) : % 대신 사용하는 함수
    3)AND, OR, NOT
    4)LIKE, IN, BETWEEN, EXISTS
    5)IS NULL, IS NOT NULL
    6)ANY, SOME, ALL
    7)함수
    
    
    연산자
    1)산술연산자 : +, -, *, /
    MOD(젯수, 피젯수) : %대신 사용하는 함수
    산술연산자는 SELECT 목록과 조건절에 사용이 가능
    
    
*/

SELECT
    2 + 2 "합"
FROM
    dual;
-- 실제 존재하지 않는 테이블DUAL, 단순히 산술연산이나 시스템 날짜 출력하거나 함수를 실행, 반환값 확인

SELECT
    5 - 2 AS 차
FROM
    dual;
-- 실제로 DB에서는 기본적으로 오라클 객체를(=테이블) 대문자로 작성하는데,
-- 소문자로 테이블명을 작성하려면 생성할 때 "소문자"로 명령을 처리

SELECT
    5 * 5 AS 곱,
    2 - 1 AS 차,
    2 / 3 몫
FROM
    dual;


--WHERE 조건절
SELECT
    *
FROM
    employees
WHERE
    salary * 12 > 100000;

SELECT
    employee_id AS 사번,
    last_name   AS 성,
    first_name  AS 이름,
    salary * 12
FROM
    employees
WHERE
    department_id = 80;

SELECT
    employee_id AS 사번,
    last_name   AS 성,
    first_name  AS 이름,
    salary * 12
    || ''
    || '$'      AS 연봉,
    department_id
FROM
    employees
WHERE
    salary * 12 = 120000;

--문자열 연결 연산자 : ||
--문자열 연결 함수 : CONCAT()
--문자 데이터, 숫자 데이터 : '로 묶음

SELECT
    employee_id   AS 사번,
    last_name
    || ' '
    || first_name AS 성명,
    salary * 12
    || ''
    || '$'        AS 연봉,
    department_id,
    job_id
FROM
    employees
WHERE
    employee_id = 101;

SELECT
    department_name
FROM
    departments
WHERE
    department_id = 90;
    
-- 컬럼의 별칭(Alias) : 컬럼에 별칭, 약어를 붙여 사용할 수 있음.
--1) 컬럼명(공백) 별칭 : ' '
--2) 키워드 AS 또는 as 사용 -- 가독성 측면에서는 select 절이 복잡해지면 as를 추가하는경우
--3) 큰 따옴표를 사용 할 수 있음(보통생략), 단 컬럼명에 공백을 포함할 경우엔 반드시 큰따옴표로 묶어야함
SELECT
    employee_id AS 사번,
    last_name   성,
    salary * 12 AS 연봉
FROM
    employees
WHERE
    employee_id = 101;

--비교연산자
--값의 크기를 비교 : =, >=, >, <, <=
SELECT
    employee_id,
    last_name,
    salary,
    department_id
FROM
    employees
WHERE
    salary <= 3000;

SELECT
    *
FROM
    employees
WHERE
    department_id > 80;

SELECT
    *
FROM
    departments;

SELECT
    *
FROM
    employees
WHERE
    last_name = 'Chen';

SELECT 'hanul' as
    employee_id,
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date > '05/09/28';
    
select *
from employees
where last_name = 'King';

select *
from employees
where hire_date < '04/01/01';