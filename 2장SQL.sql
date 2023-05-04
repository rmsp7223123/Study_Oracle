--2장
--Sturctured Query Language(=구조화된 질의어) : 데이터를 조회, 저장, 삭제하는데 사용하는 질의언어
--구조화된~ : 일정한 사용 패턴이 있음
--개발자 --> SQL -- > ORACLE DBMS : 데이터 조회/저장/삭제 요청 ---> 데이터를 처리 --> 결과

--SQL의 구분
--0)DQL(Data Query Language) : 데이터를 조회하는 명령어
--1)DML(Data Manipulation Language) : 데이터를 저장(새 데이터, 기존 데이터), 삭제하는 명령어
--2)DDL(Data Defenition Langauge) : 데이터를 저장하는 테이블 등의 객체를 생성, 삭제, 수정하는 명령어
--3)DCL(Data Control Langauge) : 데이터와 관련된 사용자 권한을 부여, 회수하는 명령어
--4)DTL(Data Transaction Language) : 데이터 처리 트랜잭션 관련 명령어
--      └ex> grant connect, create table, dba to hanul; // revoke
      

--SQL 작성 방법
--1. 대소문자 구분 X
--2. 공백(spacebar, tab)이 SQL 처리에 영향을 주지않음
--3. 문장의 마지막에 세미콜론(;)을 기술하여 명령의 끝을 표시
--4. 쿼리 실행은 CTRL+ENTER or 블럭을 씌워서 CTRL+ENTER
--5. SQLPLUS에서도 가능