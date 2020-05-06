-- 제약 조건(constraint)
-- not null : 반드시 값이 있어야 함.
-- unique : 중복된 값을 저장할 수 없음.
-- primary key : 테이블에서 유일한 한개의 행(row, record)을 검색할 수 있는 컬럼.
-- foreign key : 관계를 맺고 있는 다른 테이블의 primary key
-- check : 조건(condition)을 체크하는 제약 조건.
-- default: 컬럼의 기본값 설정.

create table ex_users (
    userid varchar2(20) not null,
    userpw varchar2(20) constraint users_pw_nn not null
);

insert into ex_users (userid, userpw)
values ('root','root1234');

select * from ex_users;

insert into ex_users(userid) values('admin');
-- NOT NULL(NN) 제약 조건이 있는 컬럼은 null을 insert 할 수 없다.

drop table ex_users;
commit;

create table ex_users(
    user_id number(4) unique,
    login_id varchar2(20) CONSTRAINT user_id_unq unique,
    login_pw varchar2(20) 
);

insert into ex_users values (1, 'guest', 'guest'); -- unique 제약 조건 위배

drop table ex_users;
-- 테이블 이름: ex_users
-- 칼럼: user-id - 숫자 4자리 , NN, Unique), user_pw(문자열 20바이트, NN)
-- 데이터 2 ~ 3개 insert


create table ex_users(
    user_id number(4) not null unique,
    user_pw varchar(20) not null
);

insert into ex_users (user_id, user_pw) values (3332,'small');

insert into ex_users values (1, 'guest'); -- unique 제약 조건 위배

select *
from ex_users;

create table ex_user2 (
    user_id number(4)
        CONSTRAINT id_nn not null
        CONSTRAINT id_unq unique,
    user_pw varchar(20)
        CONSTRAINT pw_nn not null
);

create table ex4(
    col1 number(2) primary key,
    col2 varchar2(10)
);

insert into ex4 values(1,'a');
insert into ex4 (col1) values(1);
insert into ex4 (col2) values('b');
insert into ex4 (col1) values(2);

create table ex5 (
    col1 number(2) CONSTRAINT ex5_pk PRIMARY key,
    col2 VARCHAR2(10)
    );
    
create table ex_dept (
    deptno number(2) CONSTRAINT dept_pk PRIMARY key,
    dname VARCHAR2(10) CONSTRAINT dname_nn Not null
);

create table ex_emp (
    empno number(4) CONSTRAINT emp_pk PRIMARY key,
    ename VARCHAR2(10) CONSTRAINT ename_nn not null,
    deptno number(2) CONSTRAINT dept_fk REFERENCES ex_dept (deptno)
); -- constraint 제약조건이름 references 테이블 (컬럼)

insert into ex_dept values (10, 'account');
insert into ex_dept values (20, 'research');

insert into ex_emp values (1111, 'abc', 10);
insert into ex_emp (empno,ename) values (1112, 'def');
-- FK의 의미는 다른 테이블을 참조할 수 있다는 의미.
-- null이 되면 안된다는 의미는 아님!

insert into ex_emp values(1113,'scott',30);
-- FK 제약조건이 있는 컬럼은 null이 되고 괜찮지만,
-- 값을 insert 할 때는 관련 테이블의 PK에 있는 값만 insert 가능!

select * from ex_emp;
select * from ex_dept;

-- check 제약 조건
create table ex6 (
    age number(3)
    CONSTRAINT age_check check( age > 0)
);
insert into ex6 values(16);
insert into ex6 values(-16);

create table ex7 (
    ex_name varchar2(10) not null,
    ex_date date default sysdate
);
insert into ex7 values ('abc',null);
insert into ex7 (ex_name) values ('abd');

SELECT * FROM ex7;




