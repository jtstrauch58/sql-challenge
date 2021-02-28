-- Create schemas
-- Employee table

drop table employees;

create table employees (
	emp_no int primary key,
	emp_title varchar(50) not null,
	birth_date date not null,
	first_name VARCHAR(50) not null,
	last_name VARCHAR(50) not null,
	sex char(1) not null,
	hire_date date not null
	);
	
select * from employees

drop table departments;
create table departments(
	dept_no varchar(50) primary key,
	dept_name varchar(50) not null
	);
select * from departments;

drop table emp_dept;

select * from emp_dept;

create table emp_dept(
	emp_no int not null,
	dept_no varchar(50) not null
	);
select * from emp_dept;

drop table dept_manager;

create table dept_manager(
	dept_no varchar(50) not null,
	emp_no int primary key
	);

select * from dept_manager;

create table salaries(
	emp_no int primary key,
	salary int not null
	);

select * from salaries;

create table titles(
	title_id varchar(50) primary key,
	title varchar(50) not null
	);











