����, ����, ����
DML(Data Manipulation Language) - INSERT, UPDATE, DELETE(SELECT)
CRUD (WEB���� �⺻4���� ������ ��� CRUD�����)
DDL(Data Definition Language) - CREATE, ALTER, DROP (���̺��� �����ϰ�, �����ϰ�, ����)
JAVA(JDBC)-> (SQL)DBMS ->DB(Exceló�� ���常 �ϴ� â��)
SELECT
    1
FROM
    dual;

--KEY ������ ���̽��� ����ȭ ������ ��ġ�µ� �� �� �����͸� �ϳ��� ���ų� ������ �� �ְ� ���ִ� �ĺ���
--�������ġ�� �� �ĺ��� : �ֹε�Ϲ�ȣ, �� �ĺ��� : �θ���� �ֹε�Ϲ�ȣ
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
-- ��� �۾��� ��� �͵��� �ǵ�����(ROLLBACK)
-- ��� �۾��� ������ Ȯ��(COMMIT)
--Ʈ����� : DB�۾��� �ּ����� ���� : DBMS�� �۾��� �س��� Ȯ���Ұ����� ����ϴ� ����

SELECT
    *
FROM
    mbj;

UPDATE mbj
SET
    col1 = '�ٲ�'
WHERE
    col2 = '1';

COMMIT;

CREATE TABLE korea_people (
    jumin_num NUMBER PRIMARY KEY, -- �ߺ��Ǹ� �ȵǴ� ������(KEY,�ĺ���)�� �ǹ�
    name      VARCHAR2(20),
    gender    NUMBER
);

INSERT INTO korea_people (
    jumin_num,
    name,
    gender
) VALUES (
    '1',
    '�̸�',
    '1'
);

SELECT
    *
FROM
    korea_people;

CREATE TABLE ������� (
    ���п��� VARCHAR2(100) PRIMARY KEY,
    �湮���� VARCHAR2(100),
    ����   VARCHAR2(100),
    ����   VARCHAR2(100)
);

INSERT INTO ������� (
    "���п���",
    "�湮����",
    "����",
    "����"
) VALUES (
    '2014-10',
    '252142',
    '57421',
    '194721'
);

INSERT INTO ������� (
    "���п���",
    "�湮����",
    "����",
    "����"
) VALUES (
    '2014-11',
    '131547',
    '50389',
    '81158'
);

SELECT
    *
FROM
    �������;

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
    '����',
    '����',
    '�ۼ���',
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
    '����',
    '����',
    '�ۼ���',
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
    '����3',
    '����3',
    '�ۼ���3',
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
    '����4',
    '����4',
    '�ۼ���4',
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
    board_title = '������Ʈ�� Ư�� ���� ����'
WHERE
    board_num = 1;

DELETE FROM board
WHERE
    board_num = 2;

select * from board
order by 1;

-- ���ڸ� ��ȸ�� ���� �ϳ��� �ڹ��ڵ�� �ؿ� �� ����� ���븸 �Է¹޾� insert
select max(board_num) from board;

    
