-- hr 계정 사용

-- 부서별 급여 최솟값

select department_id, min(salary) from employees group by department_id
order by department_id;

-- 부서 내에서 급여가 가장 낮은 직원의 정보

select * from employees where salary in(
select min(salary) 
from employees 
group by department_id
)
order by department_id;

select * from employees where (department_id, salary) in(
select department_id, 
min(salary) 
from employees 
group by department_id
)
order by department_id;

select A.employee_id,A.first_name
from(
    select rownum as rn, employee_id, first_name
    from employees
    order by employee_id desc) A
where A.rn between 1 and 5;





