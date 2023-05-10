--�����Լ� + ����� �����Լ� ==> PL/SQL (SQL�� �̿��� ���α׷��� ����)
--�Լ� : ��Դ� return���� ����
--���ν��� : return ���� ���� �Լ� ����
--�⺻������ ����� ���� �Լ��� �⺻�Լ��� ���� Ư���� ó���� ����� ��ȯ�� ���� ����(PL/SQL)

--�⺻�Լ� : �� �� �ϳ��� ����� ��ȯ�ϴ� "���� ��" �Լ�
--�Լ����� ����ϴ� �Ķ����, ���� ������ ���� �Լ��� ����
--�Լ��� ���� : ����, ����, ��¥, ��ȯ, �Ϲ��Լ�

--1. �����Լ�
--    ABS() : ���밪
SELECT
    abs(32),
    abs(- 32)
FROM
    dual;
--    SIGN() : ��ȣ(����, ���, 0)
SELECT
    sign(32),
    sign(- 32),
    sign(0)
FROM
    dual;
--    ROUND(n [,i]) : �ݿø� �Լ� ..n�� �Ҽ��� i��° �ڸ��� �ݿø��� ����� ��ȯ�ϴ� �Լ�
SELECT
    ( 100 + 90 + 75 ) / 3    avg1,
    round(88.93333333333333) avg2,
    round(123.45678)         avg3,
    round(123.45678, - 1)    avg4,
    round(123.45678, 0)      avg5,
    round(123.45678, 1)      avg6
FROM
    dual;
--i�� ������ ���, ������ i��° �ڸ����� �ݿø�
--[,i] : �ɼ�(=����), ������ �⺻ ��0
--trunc(n[,i]) : ���� �Լ� .. �⺻������ round�� ����.
SELECT
    trunc(123.456787)      t1,
    trunc(123.456787, 0)   t2,
    trunc(123.456787, 2)   t3,
    trunc(123.456787, - 2) t4
FROM
    dual;

--ceil(n) : n�� ���ų� ū ���� ���� ����
SELECT
    ceil(0.12345) ceil1,
    ceil(123.45)  ceil2
FROM
    dual;


--floor(n) : n�� ���ų� ���� ���� ū ����
SELECT
    floor(0.12345) floor1,
    floor(123.45)  floor2
FROM
    dual;


--mod(m, 2) : m�� n���� ���� ������ ���� ��ȯ�ϴ� �Լ�
--%: like �����ڿ� �Բ� '���� ���ڿ�' ã�� ������ ��ȣ�� ����
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

--2. �����Լ�
--concat(char1, char2) : �� ���ڿ� char1, char2�� �����Ͽ� ��ȯ�ϴ� �Լ�
--|| : ���ڿ� ���� ������

SELECT
    concat('Hello', 'Oracle') concat1,
    'Hello'
    || ' '
    || 'Oracle'               concat2
FROM
    dual;

--initcap(char) : ���ĺ� �ܾ� ������ ù���ڸ� �빮ȭ�Ͽ� ��ȯ�ϴ� �Լ�
--upper(char) : ���ĺ��� ��� �빮��ȭ�Ͽ� ��ȯ�ϴ� �Լ�
--lower(char) : ���ĺ��� ��� �ҹ���ȭ�Ͽ� ��ȯ�ϴ� �Լ�

SELECT
    initcap('i am a boy') cap1,
    upper('i am a boy')   cap2,
    lower('i am a boy')   cap3
FROM
    dual;

--lpad(char1, n [,char2])
--rpad(char1, n [,char2])
--lpad�� ���ʿ� ����(=����,�⺻��)/���ڿ�(char2)�� ä���, rpad�� �����ʿ� ����(=����,�⺻��)/���ڿ�(cahr2)�� ä�� ��ȯ�Ѵ�.

SELECT
    lpad('abc', 7)      AS lpad1,
    lpad('abc', 7, '*') AS lpad2,
    rpad('abc', 7)      AS rpad1,
    rpad('abc', 7, '*') AS rpad2
FROM
    dual;

--ltrim(char1 [,char2]) : ���ڿ� char1���� char2�� ������ ���ڸ� ������ ����� ��ȯ
--rtrim(char1 [,char2]) : ���ڿ� char1���� char2�� ������ ���ڸ� ������ ����� ��ȯ
--�����ϰ��� �ϴ� ���ڿ� ���� : ����Ʈ�� ���鹮�� �Ѱ��� ����

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

--trim([leading, trailing, both] [,trim_char] [from] char) : ���ڿ� char�� ����(leading)�̳�
--������(trailing) �Ǵ� ����(both)���� ������(=������) trim_char ���ڸ� ������ ����� ��ȯ�ϴ� �Լ�
--���� : leading(=left), trailing(=right), both(left and right) (�⺻���� ������ both, �⺻�� = ��������)

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

--substr(char, position [,length]) : ���ڿ��� �Ϻθ� ����/�и��ؼ� ��ȯ�ϴ� �Լ�
--char : ������ ���ڿ�
--position : ������ ��ġ, ���� 0���� ����� ��� 1�� ����(=���ڿ��� ù��° �ڸ�)
--length : ����, ���� ==> ������ ������

SELECT
    substr('You are not alone', 9, 3)   sbstr1, -- 9��° ��ġ���� 3���ڸ� �и��ؼ� ��ȯ
    substr('You are not alone', 5)      sbstr2, -- 5��° ��ġ�������� ������
    substr('You are not alone', 0, 3)   sbstr3, -- position�� 0���� ����ϸ� 1�� �⺻��
    substr('You are not alone', - 9, 3) sbstr4, -- position�� ������ ���ڿ� �ڿ�������
    substr('You are not alone', - 5)    sbstr5 -- �ڿ��� 5��°���� ������
FROM
    dual;

SELECT
    substr('admin@hanuledu.co.kr', 1)    email_id,
    substr('admin@hanuledu.co.kr', 3, 7) email_domain,
    substr('062-362-7797', 0)            local_number,
    substr('062-362-7797', - 5, 5)       remainder_number
FROM
    dual;

--replace(char, search_string [,replace_string]) : ���ڿ��� �Ϻθ� �ٸ����ڿ��� �����Ͽ� ��ȯ�ϴ� �Լ�
--char : ���ڿ�
--search_string : ã�� ���ڿ�
--replace_string : ������ ���ڿ�, �����ϰų� null�� ���°�� search_string ���ڿ��� ������ ����� ��ȯ��

SELECT
    replace('You are not alone', 'You', 'We')  rep1,
    replace('You are not alone', ' not')       rep2,
    replace('You are not alone', ' not', NULL) rep3
FROM
    dual;

--translate(char, from_string, to_string) : from_string���� �ش��ϴ� ���ڸ� ã�� to_string �ش��ϴ� ���ڷ� 1:1 ��ȯ�Ͽ� ��ȯ

SELECT
    translate('u! You are not alone', 'You', 'We') trans1,
    replace('u! You are not alone', 'You', 'We')   replace2
FROM
    dual;

SELECT
    replace('�ʴ� ���� �𸣰ڴµ� ���� �ʸ� �˰ڴ���', '��', '��')     replace1,
    translate('�ʴ� ���� �𸣰ڴµ� ���� �ʸ� �˰ڴ���', '�ʳ�', '����') trans1
FROM
    dual;

--instr(char, search_string [,position] [,th]) : ���ڿ����� Ư�� ���ڿ��� ���� ��ġ�� ��ȯ�ϴ� �Լ�/
--char : ���ڿ�
--search_string : ã�� ����
--position : ���ڿ��� ã�� ���� ��ġ
--_th : ���°
--���ڿ��� position ��ġ�������� Ư�� ���ڸ� ã�� ������ _th��°�� �ش��ϴ� ���� ��ġ�� ��ȯ�ϴ� �Լ�
--ã�� ���ڿ��� �߰ߵ��� ������ 0�� ��ȯ
--ã�� ���ڿ��� �߰ߵǸ� �ش� ��ġ���� ��ȯ

SELECT
    instr('Every Sha-la-la-la', 'la')        instr1, -- position default
    instr('Every Sha-la-la-la', 'la', 7)     instr2, --7��° ��ġ���� ã�� �����ؼ� ù��° la�� ��ġ
    instr('Every Sha-la-la-la', 'la', 1, 2)  instr3, -- �ι�° la�� ��ġ
    instr('Every Sha-la-la-la', 'la', 12, 2) instr4, -- 12��° ��ġ���� ã�� �����ؼ� �ι�° la�� ��ġ
    instr('Every Sha-la-la-la', 'la', 15, 1) instr5
FROM
    dual;

--length(char) : ���ڿ��� ���̸� ��ȯ
--lengthb(char) : ���ڿ��� ����Ʈ ���� ��ȯ

SELECT
    length('Every Sha-la-la-la') len1,
    length('����ȭ ���� �Ǿ����ϴ�')       len2,
    lengthb('Every Sha-la-la-la')
    || ' bytes'                  len3,
    lengthb('��')
    || ' bytes'                  len4
FROM
    dual;


--3. ��¥�Լ�
--��¥�� ���Ҿ� �ð��� ���� ������� �Ѵ�.

--sysdate
--�ý����� ���� ��¥�� ������ ��ȯ�ϴ� �Լ�
--�� ��¥�� �ð��� �����ϰ� ����
--sysdate �Լ��� �ٸ� �Լ��� �ٸ��� �Ķ���Ͱ� ���� ()�� ������� ����

--yy  vs  rr ǥ��� : 50�̻��̸� 1900���, 50�̸��̸� 2000��� ǥ���
SELECT
    sysdate
FROM
    dual;

--select �÷���
--from ���̺��(=���) v$nls_parameters

-- ���̺� / table(��ü) : �����͸� ����
-- �� / view(��ü) : ���̺��� �Ϻθ� �����ؼ� ��ġ ���̺�ó�� ���(��ȸ|����..)

SELECT
    *
FROM
    emp_details_view; -- �並 ��ȸ (�ӽ� �� - �޸𸮿� ����)

ALTER SESSION SET nls_date_format = 'RR/MM/DD';

SELECT
    sysdate,
    systimestamp
FROM
    dual;

--add_months(date, n) : date�� ������ n�� ���ؼ� �� ���(��¥)�� ��ȯ�ϴ� �Լ�

SELECT
    add_months(sysdate, 1) month1,
    add_months(sysdate, 2) month2
FROM
    dual;

--months_between(date1, date2) : �� ��¥ ������ �������� ���Ͽ� ��ȯ�ϴ� �Լ�
--date1 : ���� ��¥
--date2 : ���� ��¥
--date1 - date2 �������� ���

SELECT
    abs(round(months_between('2013-03-20', sysdate))) AS remained,
    abs(trunc(months_between(sysdate, '2013-08-28'))) AS pass
FROM
    dual;

--last_day(date) : date�� �ش��ϴ� ���� ������ ��¥�� ��ȯ��
SELECT
    last_day(sysdate)
FROM
    dual;

--NEXT_DAY ( DATE , CHAR ) : DATE���� ��¥�߿� CHAR�� ��õ� ù��° ���ڸ� ��ȯ�ϴ� �Լ� , ���ƿ��¿��� ( CHAR ) �� ��¥�� ��ȯ�ϴ� �Լ�
select next_day(sysdate, '������') next1,
    next_day(sysdate, '�ݿ���') next2,
    next_day(sysdate, '��') next3,
    next_day(sysdate, 'ȭ') next4,
    next_day(sysdate, 4) next5
    from dual;

--nls ���� : �ѱ����� ����Ŭ ��ġ ==> �ڵ����� korean ==> ���ϸ� �ѱ۷�


--4. ��ȯ�Լ�




--5. �Ϲ��Լ�

--null ��ü�� ��, �� ������� �� �� ����
--nvl(exp1, exp2) : exp1�� null�̸� exp2 ��ȯ, exp1�� null�� �ƴϸ� exp1�� ��ȯ
--nvl2(exp1, exp2, exp3) : exp1�� null�̸� exp3 ��ȯ, exp1�� null�� �ƴϸ� exp2�� ��ȯ

--coalesce(exp1, exp2, exp3, ...) : �Ķ���� ��Ͽ��� ù��°�� null�� �ƴ� exp�� ��ȯ�ϴ� �Լ�
--�Ķ���� ��Ͽ� null �ƴ� ���� �ϳ��� �����ؾ��� ==> ��� null�ϰ�� null ��ȯ

select employee_id, first_name, salary, commission_pct
from employees
where commission_pct is not null;

select employee_id, first_name, salary, commission_pct, salary * commission_pct as comm
from employees
where salary * commission_pct < 1000;
