-- SQL 命令式
# Ctrl + Enter
show databases;
create database db_school;
show tables from db_school;
create table db_school.student
(
  -- 字段名 数据类型 [数据范围] [约束] 注释。
  sno varchar(255) unique comment '学号',
  name varchar(255) comment '学生姓名',
  age  int(2) comment '年龄',
  height double(3,2) not null comment '身高 x.yz 米',
  dob date comment '出生年月日 Date Of Birth'
)comment '学生表';
# 查看注释
show full columns from db_school.student;
select *
from db_school.student;
insert into db_school.student value ('001','Tom', 19, 1.75, '2000-01-23');
insert into db_school.student value ('002','Jerry', 18, 1.65, '2001-01-23');
insert into db_school.student value ('003','Tester', 18, 1.68, '2001-01-23');
update db_school.student
set age = 20;
drop table db_school.student;
drop database db_school;
