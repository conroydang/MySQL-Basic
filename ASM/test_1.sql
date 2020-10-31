create database test_2;
use test_2;
create table Employee(
emp_id int auto_increment ,
frist_name varchar(50),
last_name varchar(59),
brithday datetime,
sex varchar(1),
salary decimal,
super_id int ,
branch_id int,
primary key(emp_id)
);
create table Branch(
branch_id int,
branch_name varchar(50),
mgr_id int,
mgr_start_date datetime,
primary key(branch_id),
foreign key (branch_id) references Employee(branch_id),
foreign key (mgr_id) references Employee(emp_id)

);
create table client(
client_id int,
client_name varchar(100),
branch_id int,
primary key (client_id),
foreign key (branch_id) references Employee(branch_id)
);
create table works(
emp_id int,
client_id int,
total_sales decimal,
primary key(emp_id,client_id),
foreign key(client_id) references client(client_id),
foreign key(emp_id) references Employee(emp_id)
);
create table brach_super(
branch_id int,
suppliar_name varchar(100),
supply_type varchar(50),
primary key(branch_id,suppliar_name),
foreign key(branch_id) references Branch(branch_id)
);
select * from employee
