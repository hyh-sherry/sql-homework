DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;


CREATE TABLE employees (
  emp_no integer primary key NOT NULL,
  birth_date date,
  first_name varchar(200) NOT NULL,
  last_name varchar(200) NOT NULL,
  gender varchar(200),
  hire_date date
);

CREATE TABLE salaries (
  emp_no int NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  salary int,
  from_date date,
  to_date date
);

CREATE TABLE titles (
  emp_no int NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  title varchar(200),
  from_date date,
  to_date date
);

CREATE TABLE departments (
    dept_no varchar(200) primary key NOT NULL,
	dept_name varchar(200)
);

CREATE TABLE dept_emp (
  emp_no int NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  dept_no varchar(200) NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  from_date date,
  to_date date
);

CREATE TABLE dept_manager (
  dept_no varchar(200) NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  emp_no int NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  from_date date,
  to_date date
);


select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;