-- DML : insert, update, delete

select * from ex_emp;

-- ex_emp 테이블에서 empno가 1111인 레코드의 ename을 변경
update ex_emp
set ename = 'scott', deptno = 20
where empno = 1111;

-- update, delete 에서 where를 사용하지 않으면
-- 테이블의 모든 행의 데이터가 변경

update ex_emp
set ename = '오쌤';

select * from ex_emp;

insert into ex_emp(empno,ename) values (1113,'King');
insert into ex_emp values (1154,'tiger',20);

select * from ex_emp;

-- deptno가 null인 데이터를 deptno = 10 으로 업데이트

update ex_emp
set deptno =10
where deptno is null;

select * from ex_emp;

-- delete
delete from ex_emp where empno = 1112;

-- ex_emp 테이블에서 deptno가 20인 레코드 삭제
delete from ex_emp where deptno = 10;

delete from ex_emp;
commit;

insert into ex_emp values (1111,'scott',10 );
insert into ex_emp values (2222,'King',20 );

insert into ex_dept values (30, 'itwill');

select * from ex_dept;

DELETE from ex_dept
where deptno = 30; -- 삭제 성공

DELETE from ex_dept
where deptno = 20; -- 삭제 실패

-- ex_emp 테이블의 deptno는 FK로 ex_dept 테이벌의 deptno를 참조함.
-- 다른 테이블에서 참조하는 레코드인 경우는 delete하지 못함.
-- ex_emp 테이블에서 deptno = 20인 레코드들을 모두 삭제한 후
-- ex_dept 테이벌에서 deptno=20인 레코드를 삭제할 수 있음.

-- create ~as select 구문: 테이블 복사
-- 테이블을 생성할 때 다른 테이블의 구조와 데이터를 그대로 가져오는 방법
-- emp 테이벌의 모든 데이터를 emp_copy 테이블로 복사
create table emp_copy;


select * from emp_copy;

-- emp 테이블에서 comm이 null이 아닌 데이터만 복사해서 emp_copy2 테이블을 생성

create table emp_copy2
as select * from emp where comm is not null;

select * from emp_copy2;

--insert ~ select 구문
-- 다른 테이블에서 select한 내용을 insert 하는 방법.
-- where 대신에 select 구문을 사용함.
-- emp 테이블에서 deptno= 10 인 레코드들을 emp_copy2 테이블에 insert
insert into emp_copy2
select * from emp where deptno = 10;
select * from emp_copy2;

