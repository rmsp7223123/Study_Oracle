정의, 조작, 제어
DML(Data Manipulation Language) - INSERT, UPDATE, DELETE(SELECT)
CRUD (WEB에서 기본4가지 로직을 묶어서 CRUD라고함)
DDL(Data Definition Language) - CREATE, ALTER, DROP (테이블을 생성하고, 삭제하고, 수정)
JAVA(JDBC)-> (SQL)DBMS ->DB(Excel처럼 저장만 하는 창고)
SELECT
    1
FROM
    dual;

--KEY 데이터 베이스가 정규화 과정을 거치는데 그 때 데이터를 하나로 묶거나 구분할 수 있게 해주는 식별자
--사람으로치면 주 식별자 : 주민등록번호, 부 식별자 : 부모님의 주민등록번호
--NUMBER(int) , VARCHAR2(String), NVARCHAR2(String)
CREATE TABLE mbj (
    col1 VARCHAR2(1000),
    col2 NUMBER,
    col3 VARCHAR2(1000),
    col4 VARCHAR2(1000),
    col5 VARCHAR2(1000)
);
--DROP TABLE MBJ;

INSERT INTO mbj (
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

ROLLBACK;
-- 방금 작업한 모든 것들을 되돌리다(ROLLBACK)
-- 방금 작업한 모든것을 확정(COMMIT)
--트랜잭션 : DB작업에 최소한의 단위 : DBMS가 작업을 해놓고 확정할건지를 대기하는 상태

SELECT
    *
FROM
    mbj;

UPDATE mbj
SET
    col1 = '바꿈'
WHERE
    col2 = '1';

COMMIT;

CREATE TABLE korea_people (
    jumin_num NUMBER PRIMARY KEY, -- 중복되면 안되는 데이터(KEY,식별자)를 의미
    name      VARCHAR2(20),
    gender    NUMBER
);

INSERT INTO korea_people (
    jumin_num,
    name,
    gender
) VALUES (
    '1',
    '이름',
    '1'
);

SELECT
    *
FROM
    korea_people;

CREATE TABLE 관광통계 (
    구분연월 VARCHAR2(100) PRIMARY KEY,
    방문객수 VARCHAR2(100),
    무료   VARCHAR2(100),
    유료   VARCHAR2(100)
);

INSERT INTO 관광통계 (
    "구분연월",
    "방문객수",
    "무료",
    "유료"
) VALUES (
    '2014-10',
    '252142',
    '57421',
    '194721'
);

INSERT INTO 관광통계 (
    "구분연월",
    "방문객수",
    "무료",
    "유료"
) VALUES (
    '2014-11',
    '131547',
    '50389',
    '81158'
);

SELECT
    *
FROM
    관광통계;

COMMIT;

CREATE TABLE board (
    board_num     NUMBER PRIMARY KEY,
    board_title   VARCHAR2(100) NOT NULL,
    board_content VARCHAR2(2000),
    writer        VARCHAR(100),
    write_date    VARCHAR(20)
);

SELECT
    *
FROM
    board;

INSERT INTO board (
    board_num,
    board_title,
    board_content,
    writer,
    write_date
) VALUES (
    '1',
    '제목',
    '내용',
    '작성자',
    '2023-05-12'
);

INSERT INTO board (
    board_num,
    board_title,
    board_content,
    writer,
    write_date
) VALUES (
    '2',
    '제목',
    '내용',
    '작성자',
    '2023-05-12'
);

INSERT INTO board (
    board_num,
    board_title,
    board_content,
    writer,
    write_date
) VALUES (
    '3',
    '제목3',
    '내용3',
    '작성자3',
    '2023-05-12'
);

INSERT INTO board (
    board_num,
    board_title,
    board_content,
    writer,
    write_date
) VALUES (
    '4',
    '제목4',
    '내용4',
    '작성자4',
    '2023-05-12'
);

SELECT
    *
FROM
    board
    order by 1;    
    
    
commit;
UPDATE board
SET
    board_title = '업데이트로 특정 값만 변경'
WHERE
    board_num = 1;

DELETE FROM board
WHERE
    board_num = 2;

select * from board
order by 1;

-- 숫자를 조회로 따로 하나를 자바코드로 해온 뒤 제목과 내용만 입력받아 insert
select max(board_num) from board;

    
