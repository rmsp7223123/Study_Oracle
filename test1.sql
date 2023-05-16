commit;

INSERT INTO BOARD2
SELECT MAX(TEXT_NUMBER)+1, 'TITLE', 'CONTENTS', 'MEMBER_ID', sysdate
FROM BOARD2;

SELECT * FROM board2;
commit;
rollback;

SELECT * FROM BOARD2 order by 1 asc;

SELECT MIN(TEXT_NUMBER) MIN_NUM , MAX(TEXT_NUMBER) MAX_NUM FROM BOARD2;

select max(text_number) from board2;

commit;
