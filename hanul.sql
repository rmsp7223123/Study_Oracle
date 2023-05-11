정의, 조작, 제어
DML(Data Manipulation Language) - INSERT, UPDATE, DELETE(SELECT)
CRUD (WEB에서 기본4가지 로직을 묶어서 CRUD라고함)
DDL(Data Definition Language) - CREATE, ALTER, DROP (테이블을 생성하고, 삭제하고, 수정)
JAVA(JDBC)-> (SQL)DBMS ->DB(Excel처럼 저장만 하는 창고)

SELECT 1 FROM DUAL;

--KEY 데이터 베이스가 정규화 과정을 거치는데 그 때 데이터를 하나로 묶거나 구분할 수 있게 해주는 식별자
--사람으로치면 주 식별자 : 주민등록번호, 부 식별자 : 부모님의 주민등록번호
--NUMBER(int) , VARCHAR2(String), NVARCHAR2(String)
CREATE TABLE MBJ(
    COL1 VARCHAR2(1000),
    COL2 NUMBER,
    COL3 VARCHAR2(1000),
    COL4 VARCHAR2(1000),
    COL5 VARCHAR2(1000)
);
--DROP TABLE MBJ;

    INSERT INTO MBJ (
        col1,
        col2,
        col3,
        col4,
        col5
    ) VALUES (
        'A',
        '3',
        'C',
        'D',
        'E'
    );
    rollback;
-- 방금 작업한 모든 것들을 되돌리다(ROLLBACK)
-- 방금 작업한 모든것을 확정(COMMIT)
--트랜잭션 : DB작업에 최소한의 단위 : DBMS가 작업을 해놓고 확정할건지를 대기하는 상태

select * from MBJ;
update MBJ set col1 = '바꿈'
where col2 ='1';
commit;
CREATE TABLE KOREA_PEOPLE (
    JUMIN_NUM NUMBER PRIMARY KEY, -- 중복되면 안되는 데이터(KEY,식별자)를 의미
    NAME VARCHAR2(20),
    GENDER NUMBER
);

INSERT INTO KOREA_PEOPLE (JUMIN_NUM, NAME, GENDER) VALUES ('1', '이름', '1');

SELECT * FROM KOREA_PEOPLE;

CREATE TABLE 관광통계 (
    구분연월 VARCHAR2(100) PRIMARY KEY,
    방문객수 VARCHAR2(100),
    무료 VARCHAR2(100),
    유료 VARCHAR2(100)
);
INSERT INTO 관광통계 ("구분연월", "방문객수", "무료", "유료") VALUES ('2014-10', '252142', '57421', '194721');
INSERT INTO 관광통계 ("구분연월", "방문객수", "무료", "유료") VALUES ('2014-11', '131547', '50389', '81158');
SELECT * FROM 관광통계;
COMMIT;
