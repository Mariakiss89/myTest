create database my_first_db;

drop database my_first_db;

use my_first_db;


create table people_students(
first_name varchar(30),
birtday date,
age int,
student bool);

insert into people_students(first_name,birtday,age)
values ('Maria','1989-08-19',32), ('Sveta','1990-01-27',31);

alter table people_students
add column class varchar(10);

update people_students set class ='1-A' where first_name= 'Maria';



alter table people_students
add column id int NOT NULL Auto_increment,
add primary key(id);

alter table people_students
modify column id int NOT NULL first;

alter table people_students
modify column student bool after class;

select * from people_students;

create table products (
id int not null Auto_increment,
name varchar(30) not null,
price int not null,
primary key(id));

insert into products(name,price)
values ('dress', 100), ('hat',30),('jeans', 120),('Asus', 20000),('Apple_Macbook',37000),('Cat',20),('Car',38);


create table categories(
id int not null Auto_increment,
name varchar(30) not null,
country varchar(30) not null,
primary key(id));

insert into categories( name,country)
values ('Clothing','Ukraine'),('Clothing','Poland'),('Laptops','USA'),('Laptops','Germany'),('Toys','Ukraine'),('Toys','Poland');


alter table products
add column categories_id int,
add foreign key (categories_id)
references categories(id);

CREATE TABLE student_course (
  studentId INT NOT null,
  courseId INT NOT NULL,
  foreign key (studentId)
  references student(id),
  foreign key (courseId)
  references course(id));



create table driver(
id int not null auto_increment unique primary key,
name varchar(40) not null);

create table license(
id int not null auto_increment primary key,
penalty_points int not null default 0,
registration_number varchar(8) unique not null);

alter table driver
add column license_id int unique,
add foreign key (license_id)
references license(id);

insert into driver (name, license_id)
values ('Boris',1),('',2),('',3);

insert into license (penalty_points, registration_number)
values (120,'BT7575'),(110,'CT6757'),(115,'AB5676');



select * from students;
select * from license;


create table students(
id int not null Auto_increment primary key,
name varchar(30) not null,
last_name varchar(30) not null,
age int not null);

drop table students;

create table subject(
id int not null Auto_increment primary key,
subject varchar(30) not null,
hours int not null);

insert into students( name,last_name,age)
values ('Maria','Kislukhina',32),
('Sveta','Kholoden',27),
('Artem','Savchuk',28),
('Boris','Promin',30);

insert into subject( subject,hours)
values ('1',4), ('2',3),('3',4),('4',1);

create table students_subject(
students_id int not null,
subject_id int not null,
primary key(students_id,subject_id),
foreign key (students_id)
references students(id),
foreign key (subject_id)
references subject(id)
);


create table bag(
id int not null auto_increment primary key,
color varchar(40) not null,
brand varchar(40) not null,
students_id int,
foreign key (students_id)
references students(id));

insert into bag(color,brand,students_id)
values ('red','Puma',1),
('black','Nike',2),
('white','adidas',3),
('pink','samsonite',1),
('purple','next',1);

select * from students 
left join bag on students.id= bag.students_id;


update bag
set students_id= null where students_id in(
select id from students where name like  'Maria'
);

insert into students_subject(students_id,subject_id)
values (1,1),(1,2),(1,3),(2,2),(2,4),(3,3),(4,1),(4,4),(3,1),(2,1);

insert into students( name,last_name,age)
values ('Kirill','hz',27);


select * from students
left join students_subject on students_id=students_subject.students_id
left join subject on subject.id =students_subject.subject_id;



select * from students;
select * from subject;
select * from students_subject;
select * from bag;