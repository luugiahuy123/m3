drop database if exists demotomcat;
create database if not exists demotomcat;
use demotomcat;

create table class (
	id int auto_increment primary key,
    name varchar (255)
);

create table student(
	id int auto_increment primary key,
    name varchar(255),
    email varchar(255),
    date_of_birth date,
    address varchar(255),
    phone varchar(10),
    classroom int,
    foreign key (classroom) references class (id)
);

insert into class (name ) values ('c1123g1'),('c1123g2');
select * from class;

insert into student(name, email, date_of_birth, address, phone, classroom) values('nhon','nhon@gmail.com', '1998-10-09','dailoc','3453454',1);
select * from student;

select * from student join class on class.id = student.classroom;

select student.*, class.name as class from student join class on class.id = student.classroom;