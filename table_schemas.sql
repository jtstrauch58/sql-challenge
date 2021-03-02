-- Create schemas

-- Create titles table

drop table titles;

create table titles(
	title_id varchar(50) primary key,
	title_name varchar(50) not null
	);

-- Create employees table
-- emp_no unique and will be primary key
-- emp_title_id is foreign key referencing titles table (title_id)
drop table employees;

create table employees(
	emp_no int primary key,
	emp_title_id varchar(10),
	birth_date date not null,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	sex char(1) not null,
	hire_date date not null,
	foreign key (emp_title_id) references titles(title_id)
	);


-- Create departments table, dept_no is the primary key
drop table departments;

create table departments(
	dept_no varchar(50) primary key,
	dept_name varchar(50) not null
	);

-- Create employee - department table
-- emp_no and dept_no are primary (composite) keys
-- emp_no and dept_no are also foreign keys and reference employees.emp_no and departments.dept_no

drop table emp_dept;

create table emp_dept(
	emp_no int, 
	dept_no varchar(50),
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no),
	primary key (emp_no, dept_no)
	);

-- Create table salaries, emp_no is primary key and foreign key referencing employees.emp_no
drop table salaries;

create table salaries(
	emp_no int,
	salary int not null,
	foreign key (emp_no) references employees(emp_no),
	primary key (emp_no)
	);

-- Create department manager table
-- dept_no and emp_no are primary keys
-- dept_no and emp_no are foreign keys referencing employees.emp_no and departments.dept_no
drop table dept_manager;

create table dept_manager(
	dept_no varchar(50), 
	emp_no int,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no),
	primary key (emp_no, dept_no)
	);

