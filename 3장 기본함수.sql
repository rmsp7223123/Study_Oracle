--내장함수 + 사용자 정의함수 ==> PL/SQL (SQL을 이용한 프로그래밍 문법)
--함수 : 대게는 return값이 있음
--프로시저 : return 값이 없는 함수 형태
--기본적으로 사용자 정의 함수는 기본함수에 없는 특별한 처리와 결과값 반환을 위해 만듦(PL/SQL)

--기본함수 : 행 당 하나의 결과를 반환하는 "단일 행" 함수
--함수에서 사용하는 파라미터, 값의 유형에 따라 함수를 구분
--함수의 종류 : 숫자, 문자, 날짜, 변환, 일반함수

--1. 숫자함수
--    ABS() : 절대값
SELECT
    abs(32),
    abs(- 32)
FROM
    dual;
--    SIGN() : 부호(음수, 양수, 0)
SELECT
    sign(32),
    sign(- 32),
    sign(0)
FROM
    dual;
--    ROUND(n [,i]) : 반올림 함수 ..n을 소수점 i번째 자리로 반올림한 결과를 반환하는 함수
SELECT
    ( 100 + 90 + 75 ) / 3    avg1,
    round(88.93333333333333) avg2,
    round(123.45678)         avg3,
    round(123.45678, - 1)    avg4,
    round(123.45678, 0)      avg5,
    round(123.45678, 1)      avg6
FROM
    dual;
--i가 음수인 경우, 정수부 i번째 자리에서 반올림
--[,i] : 옵션(=생략), 생략시 기본 값0
--trunc(n[,i]) : 버림 함수 .. 기본적으로 round와 같음.
SELECT
    trunc(123.456787)      t1,
    trunc(123.456787, 0)   t2,
    trunc(123.456787, 2)   t3,
    trunc(123.456787, - 2) t4
FROM
    dual;

--ceil(n) : n과 같거나 큰 가장 작은 정수
SELECT
    ceil(0.12345) ceil1,
    ceil(123.45)  ceil2
FROM
    dual;


--floor(n) : n과 같거나 작은 가장 큰 정수
SELECT
    floor(0.12345) floor1,
    floor(123.45)  floor2
FROM
    dual;


--mod(m, 2) : m을 n으로 나눈 나머지 값을 반환하는 함수
--%: like 연산자와 함께 '여러 문자열' 찾는 패턴의 기호로 사용됨
SELECT
    mod(17, 4)   mod1,
    mod(17, - 4) mod2,
    mod(- 17, 4) mod3,
    mod(17, 0)   mod4
FROM
    dual;

SELECT
    employee_id,
    first_name,
    salary,
    round(salary + salary * 0.15) AS "Increased Salary round",
    trunc(salary + salary * 0.15) AS "Increased Salary trunc",
    ceil(salary + salary * 0.15)  AS "Increased Salary ceil",
    floor(salary + salary * 0.15) AS "Increased Salary floor"
FROM
    employees
WHERE
    department_id IN ( 100, 110 );

--2. 문자함수
--concat(char1, char2) : 두 문자열 char1, char2를 연결하여 반환하는 함수
--|| : 문자열 연결 연산자

SELECT
    concat('Hello', 'Oracle') concat1,
    'Hello'
    || ' '
    || 'Oracle'               concat2
FROM
    dual;

--initcap(char) : 알파벳 단어 단위로 첫글자를 대문화하여 변환하는 함수
--upper(char) : 알파벳을 모두 대문자화하여 반환하는 함수
--lower(char) : 알파벳을 모두 소문자화하여 반환하는 함수

SELECT
    initcap('i am a boy') cap1,
    upper('i am a boy')   cap2,
    lower('i am a boy')   cap3
FROM
    dual;

--lpad(char1, n [,char2])
--rpad(char1, n [,char2])
--lpad는 왼쪽에 공백(=생략,기본값)/문자열(char2)을 채우고, rpad는 오른쪽에 공백(=생략,기본값)/문자열(cahr2)를 채워 반환한다.

SELECT
    lpad('abc', 7)      AS lpad1,
    lpad('abc', 7, '*') AS lpad2,
    rpad('abc', 7)      AS rpad1,
    rpad('abc', 7, '*') AS rpad2
FROM
    dual;

--ltrim(char1 [,char2]) : 문자열 char1에서 char2로 지정한 문자를 제거한 결과를 반환
--rtrim(char1 [,char2]) : 문자열 char1에서 char2로 지정한 문자를 제거한 결과를 반환
--제거하고자 하는 문자열 생략 : 디폴트로 공백문자 한개가 사용됨

SELECT
    '['
    || ltrim('   ABCDEFG   ')
    || ']'                 ltrim1,
    ltrim('abcdefg', 'ab') ltrim2,
    ltrim('abcdefg', 'ba') ltrim3,
    ltrim('abcdefg', 'bc') ltrim3,
    '['
    || rtrim('   ABCDEFG   ')
    || ']'                 rtrim1,
    rtrim('abcdefg', 'fg') rtrim2,
    rtrim('abcdefg', 'gf') rtrim3,
    rtrim('abcdefg', 'ef') rtrim3
FROM
    dual;

--trim([leading, trailing, both] [,trim_char] [from] char) : 문자열 char의 왼쪽(leading)이나
--오른쪽(trailing) 또는 양쪽(both)에서 지정된(=제거할) trim_char 문자를 제거한 결과를 반환하는 함수
--방향 : leading(=left), trailing(=right), both(left and right) (기본값은 생략시 both, 기본값 = 양쪽제거)

SELECT
    '['
    || TRIM('   ABCDEFG   ')
    || ']' trim1,
    '['
    || ltrim('   ABCDEFG   ')
    || ']' ltrim,
    '['
    || rtrim('   ABCDEFG   ')
    || ']' rtrim,
    '['
    || TRIM(LEADING 'A' FROM 'ABCDEF')
    || ']' trim3,
    '['
    || TRIM(TRAILING 'f' FROM 'ABCDEF')
    || ']' trim4,
    '['
    || TRIM('1' FROM '1ABCDEF1')
    || ']' trim5
FROM
    dual;

--substr(char, position [,length]) : 문자열의 일부를 추출/분리해서 반환하는 함수
--char : 지정된 문자열
--position : 지정된 위치, 값을 0으로 명시할 경우 1로 적용(=문자열의 첫번째 자리)
--length : 길이, 개수 ==> 생략시 끝까지

SELECT
    substr('You are not alone', 9, 3)   sbstr1, -- 9번째 위치부터 3글자를 분리해서 반환
    substr('You are not alone', 5)      sbstr2, -- 5번째 위치에서부터 끝까지
    substr('You are not alone', 0, 3)   sbstr3, -- position을 0으로 명시하면 1로 기본값
    substr('You are not alone', - 9, 3) sbstr4, -- position이 음수면 문자열 뒤에서부터
    substr('You are not alone', - 5)    sbstr5 -- 뒤에서 5번째부터 끝까지
FROM
    dual;

SELECT
    substr('admin@hanuledu.co.kr', 1)    email_id,
    substr('admin@hanuledu.co.kr', 3, 7) email_domain,
    substr('062-362-7797', 0)            local_number,
    substr('062-362-7797', - 5, 5)       remainder_number
FROM
    dual;

--replace(char, search_string [,replace_string]) : 문자열중 일부를 다른문자열로 변경하여 반환하는 함수
--char : 문자열
--search_string : 찾을 문자열
--replace_string : 변경할 문자열, 생략하거나 null이 오는경우 search_string 문자열을 제외한 결과를 반환함

SELECT
    replace('You are not alone', 'You', 'We')  rep1,
    replace('You are not alone', ' not')       rep2,
    replace('You are not alone', ' not', NULL) rep3
FROM
    dual;

--translate(char, from_string, to_string) : from_string에서 해당하는 문자를 찾아 to_string 해당하는 문자로 1:1 반환하여 변환

SELECT
    translate('u! You are not alone', 'You', 'We') trans1,
    replace('u! You are not alone', 'You', 'We')   replace2
FROM
    dual;

SELECT
    replace('너는 나를 모르겠는데 나는 너를 알겠느냐', '너', '나')     replace1,
    translate('너는 나를 모르겠는데 나는 너를 알겠느냐', '너나', '나너') trans1
FROM
    dual;

--instr(char, search_string [,position] [,th]) : 문자열에서 특정 문자열의 시작 위치를 반환하는 함수/
--char : 문자열
--search_string : 찾을 문자
--position : 문자열을 찾는 시작 위치
--_th : 몇번째
--문자열의 position 위치에서부터 특정 문자를 찾기 시작해 _th번째에 해당하는 시작 위치를 반환하는 함수
--찾을 문자열이 발견되지 않으면 0을 반환
--찾을 문자열이 발견되면 해당 위치값을 반환

SELECT
    instr('Every Sha-la-la-la', 'la')        instr1, -- position default
    instr('Every Sha-la-la-la', 'la', 7)     instr2, --7번째 위치에서 찾기 시작해서 첫번째 la의 위치
    instr('Every Sha-la-la-la', 'la', 1, 2)  instr3, -- 두번째 la의 위치
    instr('Every Sha-la-la-la', 'la', 12, 2) instr4, -- 12번째 위치에서 찾기 시작해서 두번째 la의 위치
    instr('Every Sha-la-la-la', 'la', 15, 1) instr5
FROM
    dual;

--length(char) : 문자열의 길이를 반환
--lengthb(char) : 문자열의 바이트 값을 반환

SELECT
    length('Every Sha-la-la-la') len1,
    length('무궁화 꽃이 피었습니다')       len2,
    lengthb('Every Sha-la-la-la')
    || ' bytes'                  len3,
    lengthb('무')
    || ' bytes'                  len4
FROM
    dual;


--3. 날짜함수
--날짜와 더불어 시간을 연산 대상으로 한다.

--sysdate
--시스템의 현재 날짜를 가져와 반환하는 함수
--이 날짜는 시각을 포함하고 있음
--sysdate 함수는 다른 함수와 다르게 파라미터가 없고 ()를 사용하지 않음

--yy  vs  rr 표기법 : 50이상이면 1900년대, 50미만이면 2000년대 표기법
SELECT
    sysdate
FROM
    dual;

--select 컬럼명
--from 테이블명(=뷰명) v$nls_parameters

-- 테이블 / table(객체) : 데이터를 저장
-- 뷰 / view(객체) : 테이블의 일부만 추출해서 마치 테이블처럼 사용(조회|저장..)

SELECT
    *
FROM
    emp_details_view; -- 뷰를 조회 (임시 뷰 - 메모리에 존재)

ALTER SESSION SET nls_date_format = 'RR/MM/DD';

SELECT
    sysdate,
    systimestamp
FROM
    dual;

--add_months(date, n) : date에 개월수 n을 더해서 그 결과(날짜)를 반환하는 함수

SELECT
    add_months(sysdate, 1) month1,
    add_months(sysdate, 2) month2
FROM
    dual;

--months_between(date1, date2) : 두 날짜 사이의 개월수를 구하여 반환하는 함수
--date1 : 이후 날짜
--date2 : 이전 날짜
--date1 - date2 형식으로 계산

SELECT
    abs(round(months_between('2013-03-20', sysdate))) AS remained,
    abs(trunc(months_between(sysdate, '2013-08-28'))) AS pass
FROM
    dual;

--last_day(date) : date에 해당하는 달의 마지막 날짜를 반환함
SELECT
    last_day(sysdate)
FROM
    dual;

--NEXT_DAY ( DATE , CHAR ) : DATE이후 날짜중에 CHAR로 명시된 첫번째 일자를 반환하는 함수 , 돌아오는요일 ( CHAR ) 의 날짜를 반환하는 함수
select next_day(sysdate, '월요일') next1,
    next_day(sysdate, '금요일') next2,
    next_day(sysdate, '일') next3,
    next_day(sysdate, '화') next4,
    next_day(sysdate, 4) next5
    from dual;

--nls 설정 : 한국에서 오라클 설치 ==> 자동으로 korean ==> 요일명도 한글로


--4. 변환함수




--5. 일반함수

--null 자체는 빈값, 비교 연산등을 할 수 없음
--nvl(exp1, exp2) : exp1이 null이면 exp2 반환, exp1이 null이 아니면 exp1을 반환
--nvl2(exp1, exp2, exp3) : exp1이 null이면 exp3 반환, exp1이 null이 아니면 exp2를 반환

--coalesce(exp1, exp2, exp3, ...) : 파라미터 목록에서 첫번째로 null이 아닌 exp를 반환하는 함수
--파라미터 목록에 null 아닌 값이 하나는 존재해야함 ==> 모두 null일경우 null 반환

select employee_id, first_name, salary, commission_pct
from employees
where commission_pct is not null;

select employee_id, first_name, salary, commission_pct, salary * commission_pct as comm
from employees
where salary * commission_pct < 1000;
