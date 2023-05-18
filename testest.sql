create table TBL_COMPANY202(
    company_code number primary key,
    name nvarchar2(10) not null,
    salary number default 0,
    adress nvarchar2(200)
);

INSERT INTO TBL_COMPANY202 values (1, '�谳����' , 200 , '����1');
INSERT INTO TBL_COMPANY202 (company_code , name ) values (2, '�谳����' );
INSERT INTO TBL_COMPANY202 values (1, '�谳����' , 200 , '����1');
INSERT INTO TBL_COMPANY202 values (1, '�谳����' , 200 , '����1');

select * from tbl_company202;
select * from tbl_company202 A LEFT OUTER JOIN TBL_JOB202 B ON A.JOB = B.JOB_NUM order by 1;

commit;

--����ȭ : �����ͺ��̽��� ���������� �� ����� �ϴ� ��Ģ(����) X

update tbl_company202 set job_name ='�ڹٰ���1' where job_num = 1;

create table tbl_job202(
    JOB_NUM number primary key,
    job_name nvarchar2(200) not null
);

insert into tbl_job202 values (1, '�ڹٰ���');
insert into tbl_job202 values (2, '������');
insert into tbl_job202 values (3, '�۰���');

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
