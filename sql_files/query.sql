--1. List the following details of each employee: 
--employee number, last name, first name, gender, and salary.
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary 
from employees e 
join salaries s
on e.emp_no = s.emp_no;

--2. List employees who were hired in 1986.
select * from employees
where extract(year from hire_date) = 1986;

--3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, 
-- first name, and start and end employment dates.
select d.dept_no, d.dept_name, t1.emp_no, t1.last_name, t1.first_name, t1.from_date, t1.to_date
from
(select m.dept_no, m.emp_no, m.from_date, m.to_date, e.last_name, e.first_name
from dept_manager m
inner join employees e
on m.emp_no = e.emp_no) t1
inner join departments d
on t1.dept_no = d.dept_no
;

--4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
select t2.emp_no, t2.last_name, t2.first_name, d.dept_name
from
(select e.emp_no, e.last_name, e.first_name, de.dept_no
from employees e
inner join dept_emp de
on e.emp_no = de.emp_no) t2
inner join departments d
on t2.dept_no = d.dept_no
;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees 
where first_name = 'Hercules' and last_name like 'B%';

--6. List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
select t2.emp_no, t2.last_name, t2.first_name, d.dept_name
from
(select e.emp_no, e.last_name, e.first_name, de.dept_no
from employees e
inner join dept_emp de
on e.emp_no = de.emp_no) t2
inner join departments d
on t2.dept_no = d.dept_no
where dept_name = 'Sales'
;

--7. List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.
select t2.emp_no, t2.last_name, t2.first_name, d.dept_name
from
(select e.emp_no, e.last_name, e.first_name, de.dept_no
from employees e
inner join dept_emp de
on e.emp_no = de.emp_no) t2
inner join departments d
on t2.dept_no = d.dept_no
where (dept_name = 'Sales' or dept_name = 'Development')
;

--8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
select last_name, count(*) as counts from employees
group by last_name
order by counts desc;
