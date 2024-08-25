create table titles(
	title_id varchar(20) not null,
    title varchar(40) not null,
	primary key(title_id)
);
create table employees(	
	emp_no int not null,
    emp_title_id varchar(20) not null ,
	birth_date DATE not null,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	sex varchar(20) not null,
	hire_date DATE not null,
	foreign key(emp_title_id) references titles (title_id),
	primary key(emp_no)
); 	
create table departments(
	dept_no varchar(20) not null,
    dept_name varchar(40) not null,
	primary key(dept_no)
);
create table dept_manager(
	dept_no varchar(20) not null,
    emp_no int not null,
	foreign key(emp_no) references employees (emp_no),
    foreign key(dept_no)references departments(dept_no),
    primary key(dept_no,emp_no)
);
create table dept_emp(
	emp_no int not null,
	dept_no varchar(20) not null,
	foreign key(emp_no) references employees (emp_no),
    foreign key(dept_no)references departments(dept_no)
);
create table salaries(
	emp_no int not null,
	salary int not null,
	foreign key(emp_no) references employees (emp_no),
    primary key(emp_no)
);


