����, ����, ����
DML(Data Manipulation Language) - INSERT, UPDATE, DELETE(SELECT)
CRUD (WEB���� �⺻4���� ������ ��� CRUD�����)
DDL(Data Definition Language) - CREATE, ALTER, DROP (���̺��� �����ϰ�, �����ϰ�, ����)
JAVA(JDBC)-> (SQL)DBMS ->DB(Exceló�� ���常 �ϴ� â��)

SELECT 1 FROM DUAL;

--KEY ������ ���̽��� ����ȭ ������ ��ġ�µ� �� �� �����͸� �ϳ��� ���ų� ������ �� �ְ� ���ִ� �ĺ���
--�������ġ�� �� �ĺ��� : �ֹε�Ϲ�ȣ, �� �ĺ��� : �θ���� �ֹε�Ϲ�ȣ
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
-- ��� �۾��� ��� �͵��� �ǵ�����(ROLLBACK)
-- ��� �۾��� ������ Ȯ��(COMMIT)
--Ʈ����� : DB�۾��� �ּ����� ���� : DBMS�� �۾��� �س��� Ȯ���Ұ����� ����ϴ� ����

select * from MBJ;
update MBJ set col1 = '�ٲ�'
where col2 ='1';
commit;
CREATE TABLE KOREA_PEOPLE (
    JUMIN_NUM NUMBER PRIMARY KEY, -- �ߺ��Ǹ� �ȵǴ� ������(KEY,�ĺ���)�� �ǹ�
    NAME VARCHAR2(20),
    GENDER NUMBER
);

INSERT INTO KOREA_PEOPLE (JUMIN_NUM, NAME, GENDER) VALUES ('1', '�̸�', '1');

SELECT * FROM KOREA_PEOPLE;

CREATE TABLE ������� (
    ���п��� VARCHAR2(100) PRIMARY KEY,
    �湮���� VARCHAR2(100),
    ���� VARCHAR2(100),
    ���� VARCHAR2(100)
);
INSERT INTO ������� ("���п���", "�湮����", "����", "����") VALUES ('2014-10', '252142', '57421', '194721');
INSERT INTO ������� ("���п���", "�湮����", "����", "����") VALUES ('2014-11', '131547', '50389', '81158');
SELECT * FROM �������;
COMMIT;
