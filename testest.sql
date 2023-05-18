create table TBL_COMPANY202(
    company_code number primary key,
    name nvarchar2(10) not null,
    salary number default 0,
    adress nvarchar2(200)
);

INSERT INTO TBL_COMPANY202 values (1, '김개발자' , 200 , '광주1');
INSERT INTO TBL_COMPANY202 (company_code , name ) values (2, '김개발자' );
INSERT INTO TBL_COMPANY202 values (1, '김개발자' , 200 , '광주1');
INSERT INTO TBL_COMPANY202 values (1, '김개발자' , 200 , '광주1');

select * from tbl_company202;
select * from tbl_company202 A LEFT OUTER JOIN TBL_JOB202 B ON A.JOB = B.JOB_NUM order by 1;

commit;

--정규화 : 데이터베이스를 설계적으로 잘 만들게 하는 규칙(과정) X

update tbl_company202 set job_name ='자바개발1' where job_num = 1;

create table tbl_job202(
    JOB_NUM number primary key,
    job_name nvarchar2(200) not null
);

insert into tbl_job202 values (1, '자바개발');
insert into tbl_job202 values (2, '웹개발');
insert into tbl_job202 values (3, '앱개발');

commit;

select * from tbl_job202;

create table job_state (
    company_code number,
    job_num number ,
    constraint company_job_pk primary key(
        company_code,
        job_num
    ) enable
);

insert into job_state values ( 1, 1 );
insert into job_state values ( 1, 2 );
insert into job_state values ( 2, 3 );

select * from job_state a left outer join tbl_job202 b on a.job_num = b.job_num
                          left outer join tbl_company202 c on a.company_code = c.company_code;
