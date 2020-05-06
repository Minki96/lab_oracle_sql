-- listagg() 함수
-- 부서별 직원들
select deptno, 
    listagg(ename, ',') within group(order by ename)
from emp
group by deptno;

-- JOB이 같은 직원들을 출력
select job,
    listagg(ename, ',') within group(order by ename)
from emp
group by job;

-- 도시별(loc) 근무하는 직원들
select d.loc,
    listagg(ename, ',') within group(order by ename)
from emp e, dept d
where e.deptno = d.deptno
group by d.loc;

select d.loc,
    listagg(ename, ',') within group(order by ename)
from emp e join dept d
    on e.deptno = d.deptno
group by d.loc;


-- 위 결과에서 근무하는 직원이 없는 도시도 출력
select d.loc,
    listagg(ename, ',') within group(order by ename)
from emp e, dept d
where e.deptno(+) = d.deptno
group by d.loc;

select d.loc,
    listagg(ename, ',') within group(order by ename)
from emp e right join dept d
    on e.deptno = d.deptno
group by d.loc;

-- SQL(Structured Query Language)
-- DBMS(Database Management System)에서 데이터를 읽고 쓰고 삭제 등의
-- 데이터 관리를 위한 프로그래밍 언어

-- SQL의 종류:
-- 1) DQL(Data Query Language, 데이터 질의 언어): select
-- 2) DDL(Data Definition Language, 데이터 정의 언어): create, drop, alter, truncate
-- 3) DML(Data Manipulation Language, 데이터 조작 언어) : insert, update, delete
-- 4) TCL(Transaction Control Language, 트랜잭션 관리 언어): commt, rollback

-- 테이블 생성
create table ex1(
    ex_id number(4), -- 4자리 숫자
    ex_text varchar2(10), -- 10바이트까지 저장할 수 있는 문자열
    ex_date date -- 날짜&시간
);

--  테이블에 구조 확인(describe)
desc ex1;

-- 테이블의 모든 레코드 검색
select * from ex1;

-- 테이블에 데이터 저장/삽입(insert)
insert into ex1(ex_id, ex_text, ex_date)
values(1, '안녕하세요', sysdate);

select * from ex1;

-- DML(insert, update, delete)의 수행 결과는 메모리에만 반영되고,
-- 데이터베이스에 영구적으로 반영(저장)된 상태는 아님!
-- commit 명령어를 사용하면 데이터베이스에 영구적으로 반영됨.
commit;

insert into ex1 ( ex_id, ex_text) values(2, 'hello');
select * from ex1;

insert into ex1 ( ex_text, ex_id) values('안되요', 1234);
select * from ex1;

-- insert 문장에서 컬럼 이름들은 생략 가능
-- 컬럼 이름을 생략했을 때는 values에서 컬럼 개수만큼 값을 전달.
-- 테이블의 컬럼 순서대로 값을 전달
insert into ex1 values (999, '재밌나요?', sysdate);

desc ex1 ;

insert into ex1(ex_id) values('ab'); -- 숫자 타입이 아니어서 에러
insert into ex1(ex_id) values(12345); -- 저장할 수 있는 자릿수보다 커서 에러
insert into ex1 (ex_text) values('aaaaaaaaaa'); --영문자/숫자 10개 = 10 Bytes
-- 영문자/ 숫자/ 특서문자 1개 = 1 Byte
insert into ex1 (ex_text) values('안녕하세요?'); -- 10바이트가 넘어서 에러
-- 한글 1 글자 = 2 Bytes

insert into ex1 values (1004, null, null);
select * from ex1;

-- 테이블 이름: ex2 
-- 컬럼 : ex_id(숫자 2자리), ex_name(문자열 5글자)

create table ex2 (
    ex_id number(2),
    ex_name varchar2(5 char)
);

insert into ex2 values (1,'abcde');
insert into ex2 values (2,'abcdee'); -- 6글자여서 에러
insert into ex2 values (2,'안녕하세요');
select * from ex2;

-- 오라클 데이터 타입
-- 숫자 티입: number(x,y)
-- 전체 x 자릿수 중에서 소수점 y자리까지 허용

-- 문자열 타입: varchar2
-- varchar2(x), varchar2(x byte)
-- varchar2(x char)

-- 날짜 타입: date - 9999/12/31까지 저장
-- clob : 46까지의 문자열 저장.
-- blob : 46까지의 바이너리 저장

create table ex3(
    num number(4,2)
);

insert into ex3 values(10);
insert into ex3 values(100); -- 99.99까지 저장 가능

select * from ex3;

commit;




