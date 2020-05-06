-- comment(주석)
-- 단축키 Ctrl+Enter: 커서가 있는 한 문장을 실행
-- 테이블에서 데이터 검색
-- select 컬럼이름 form 테이블 이름
-- SQL 명령어, 테이블 이름, 컬럼 이름 등은 대/ 소문자를 구분하지 않음.
select * from emp;
select empno,ename from emp;

-- emp 테이블에서 사번(empno), 이름(ename), 입사일(hiredate), 급여(sal)을 출력

select empno, ename, hiredate, sal 
from emp;

-- emp 테이블에서 사번, 이름, 급여, 1년 급여를 출력
select empno, ename, sal, sal *12 as annual_sal 
from emp;

-- emp 테이블에서 사번(empno), 이름(ename), 급여(sal)출력
select empno as 사번,ename as 이름, sal as 급여
from emp;

-- emp 테이블에서 job을 검색
select job from emp;

-- emp 테이블에서 중복되지 않는 job을 검색
select distinct job from emp;

-- emp 테이벌에서 중복되지 않는 deptno를 검색
select DISTINCT job, deptno from emp;
