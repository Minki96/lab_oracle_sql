--2. hr 계정
--1) employees, job_history, jobs 테이블을 사용해서
--사번, 이름, 성, job_id, job_title, job 시작일, job 종료일을 출력.
select e.employee_id, e.first_name,
e.last_name, e.job_id,
j.job_title, jh.start_date,jh.end_date
from employees e, jobs j, job_history jh
where e.job_id = j.job_id
    and e.employee_id= jh.employee_id;

select e.employee_id, e.first_name,
e.last_name, e.job_id,
j.job_title, jh.start_date,jh.end_date
from employees e, job_history jh,jobs j
where e.employee_id= jh.employee_id and
e.job_id = j.job_id;
--2) employees, departments 테이블을 사용해서
--부서번호, 부서이름, 매니저 아이디, 매니저 이름/성을 출력.
--단, 부서 테이블의 모든 부서 이름이 출력되도록.

select d.department_id, d.department_name, d.manager_id,
    e.first_name, e.last_name
from employees e, departments d
where d.manager_id = e.employee_id(+)
order by d.department_id;

-- 사번 100인 직원의 이름/성, 도시를 출력
-- job id, dept id
select e.first_name, e.last_name, d.location_id, l.city
from employees e, departments d, locations l
where e.employee_id = 100
    and e.department_id = d.department_id 
    and d.location_id = l.location_id;
    
-- 부서별 급여 평균 출력
select department_id, round(avg(salary),1)
from employees
group by department_id;

-- 부서 이름과 그 부서의 급여 평균

select d.department_name, e.department_id, round(avg(e.salary),1)
from employees e, departments d
where d.department_id = e.department_id
group by d.department_name , e.department_id;

select d.department_name, e.department_id, round(avg(e.salary),1)
from employees e join departments d
    on d.department_id = e.department_id
group by d.department_name , e.department_id;

-- 위 결과에 부서의 위치(city)를 추가

select d.department_name, e.department_id, l.city, round(avg(e.salary),1)
from employees e, departments d, locations l
where d.department_id = e.department_id
    and l.location_id = d.location_id
group by d.department_name , e.department_id, l.city
order by d.department_name;

-- 위 결과에서 위치가 Seattle에 있는 부서의 부서 이름과 위치(city), 평균 급여 출력

select d.department_name, l.city, round(avg(e.salary),1)
from employees e, departments d, locations l
where   d.department_id = e.department_id
    and l.location_id = d.location_id 
    and l.city = 'Seattle'
group by d.department_name , e.department_id, l.city
having avg(e.salary) >= 7000
order by d.department_name;


-- Seattle에 있는 부서들 중에서 
-- 부서 급여 평균이 전체 직원의 급여 평균보다 높은 부서들의
-- 부서 번호, 부서 이름, city, 평균 급여 출력

select d.department_name, l.city, round(avg(e.salary),1)
from employees e, departments d, locations l
where   d.department_id = e.department_id
    and l.location_id = d.location_id 
    and l.city = 'Seattle'
group by d.department_name , e.department_id, l.city
having avg(e.salary) > (
select avg(salary) from employees
)
order by d.department_name;

