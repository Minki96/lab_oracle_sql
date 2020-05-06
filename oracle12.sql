-- JOIN
-- 두 개 이상의 테이블에서 조회한 결과를 하나로 합치는 것

-- emp, dept 테이블에서 사번, 이름, 부서번호, 부서이름 출력
-- Oracle 방식
select e.empno, e.ename, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno;

-- ANSI 표준 방식
select e.empno, e.ename, e.deptno, d.dname
from emp e join dept d
    on e.deptno = d.deptno;
-- inner join에서 inner는 생략 가능


-- emp, dept 테이블에서
-- 사번, 이름, 급여, 부서번호, 부서이름을 출력
-- 급여가 2000 이상인 직원만 선택

-- 1) Oracle
select e.empno, e.ename, e.sal, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno
    and
    e.sal >= 2000;
-- 2) ANSI
select e.empno, e.ename, e.sal, e.deptno, d.dname
from emp e join dept d 
    on e.deptno = d.deptno 
where e.sal >= 2000;


-- emp, salgrade 테이블에서 
-- 사번, 이름, 급여, 급여등급을 출력
desc salgrade;

select e.empno, e.ename, e.sal, s.grade
from emp e join salgrade s
    on e.sal between s.losal and s.hisal;
    --on s.losal <= e.sal and hisal >= e.sal;

-- emp, dept, salgrade 테이블에서
-- 사번, 이름, 부서이름, 급여, 급여등급을 출력

desc dept;

select e.empno, e.ename, d.dname, e.sal, s.grade
from emp e join salgrade s
    on e.sal between s.losal and s.hisal
join dept d
    on  e.deptno = d.deptno ;
    
-- emp 테이블에서
-- 사번, 이름, 매니저 사번, 매니저 이름을 출력

select e.empno, e.ename, e.mgr, m.ename as manager_name 
from emp e join emp m 
    on e.mgr = m.empno;

--emp 테이블에서 부서 번호 출력(중복 제외)
select DISTINCT deptno 
from emp;

select deptno 
from dept;

-- emp테이블과 dept 테이블에서 사원 이름, 부서 번호, 부서 이름을 출력
-- 모든 부서의 번화와 이름을 출력

select e.ename, d.deptno, d.deptno
from emp e, dept d
where e.deptno(+) = d.deptno; -- right join

select e.ename, d.deptno, d.deptno
from emp e right join dept d
    on e.deptno = d.deptno; -- right join
    
select e.ename, d.deptno, d.deptno
from emp e, dept d
where e.deptno = d.deptno(+); -- left join

select e.ename, d.deptno, d.deptno
from emp e left join dept d
    on e.deptno = d.deptno; -- left join
    
-- emp 테이벌에서, 사번, 이름, 매니저 번호, 매니저 이름 출력
-- left join -> king

select e1.empno, e1.ename, e1.mgr, e2.ename as 매니저
from emp e1, emp e2
where e1.mgr = e2.empno(+);

select e1.empno, e1.ename, e1.mgr, e2.ename as 매니저
from emp e1 left join emp e2
    on e1.mgr = e2.empno;
-- right join: 매니저가 아닌 직원들 정보도 함께 출력
select e1.empno, e1.ename, e1.mgr, e2.ename as 매니저
from emp e1, emp e2
where e1.mgr(+) = e2.empno;

select e1.empno, e1.ename, e1.mgr, e2.ename as 매니저
from emp e1 right join emp e2
    on e1.mgr = e2.empno;

-- full(outer) join
select e1.empno, e1.ename, e1.mgr, e2.ename as 매니저
from emp e1 full join emp e2
    on e1.mgr = e2.empno
order by e1.empno;

-- full(outer) join은 Oracle 만의 문법이 없음.
-- full join의 결과와 right join의 결과를 합집합(union) 할 수는 있음.
select e1.empno, e1.ename, e1.mgr, e2.ename as 매니저
from emp e1, emp e2
where e1.mgr = e2.empno(+)
union
select e1.empno, e1.ename, e1.mgr, e2.ename as 매니저
from emp e1, emp e2
where e1.mgr(+) = e2.empno;
