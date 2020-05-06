-- alter

-- emp_copy2 테이블에서 ename 컬럼 이름을 emp_name으로 변경

select * from emp_copy2;

alter table emp_copy2
    rename column ename to emp_name;
    
desc emp_copy2;

-- emp_name 컬럼의 데이터 타입을 varchar2(20)으로 변경
alter table emp_copy2
MODIFY emp_name varchar2(20);

-- 컬럼 추가 : etc(문자열 100바이트)
alter table emp_copy2
add etc varchar2(100 byte);

-- etc 컬럼 삭제
alter table emp_copy2
drop COLUMN etc;
desc emp_copy2;

-- empnofmf pk 제약조건 추가
alter table emp_copy2
    add CONSTRAINT pk_emp_cp2 primary key (empno);
    
-- NN은 add constraint로 할 수 없고, modify를 사용
-- emp_name을 NN으로 변경
alter table emp_copy2
    modify emp_name not null;
    
    desc emp_copy2;
    
-- job을 NN으로 변경. 제약조건 이름을 설정하면서
alter table emp_copy2
modify job CONSTRAINT nn_job not null;

-- nn_job 제약조건 삭제
alter table emp_copy2
    drop constraint nn_job;
    
desc emp_copy2;

-- emp copy2 테이블 이름을 emp_cp로 변경
rename emp_copy2 to emp_cp;

-- 테이블 생성시 column-level 제약조건
create table ex8 (
    -- column_name date_type constraint
    col1 number constraint pk_ex8 primary key,
    col2 varchar2(10) constraint nn_col2 not null
    );
    
desc ex8;

create table ex9(
    col1 number,
    col2 varchar2(10),
    col3 varchar2(10) CONSTRAINT nn_col3 not null,
    -- 다른 제약조건들은 column-level과 table-level이 모두 가능
    constraint pk_ex9 primary key (col1),
    constraint unq_col2 unique (col2)
)

-- sequence 생성
create sequence seq_ex9;
select seq_ex9.nextval from dual;

insert into ex9
values(seq_ex


