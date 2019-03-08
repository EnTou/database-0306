-- SQL 命令式
# Ctrl + Enter
show databases;
drop database if exists db_school;
create database db_school;
show tables from db_school;

drop table if exists db_school.student;
create table db_school.student
(
  -- 字段名 数据类型 [数据范围] [约束] 注释。
  id           int auto_increment primary key comment 'id PK',
  sno          varchar(255) unique comment '学号',
  gender       varchar(255) default 'male' comment '性别',
  name         varchar(255) comment '学生姓名',
  age          int(2) comment '年龄',
  height       double(3, 2) not null comment '身高 x.yz 米',
  dob          date comment '出生年月日 Date Of Birth',
  departmentID int comment '院系ID'
) comment '学生表';

alter table db_school.student auto_increment = 10000;  -- id 从10000开始自动添加

drop table if exists db_school.department;
create table db_school.department
(
  id    int auto_increment primary key comment 'id PK',
  title varchar(255) unique comment '院系名称',
  tel   varchar(255) comment '电话'
) comment '院系表';

-- 为学生表追加外键约束
alter table db_school.student
  add constraint
    student_fk_departmentID -- 别名 表明_fk_列明     fk：(外界键)
    foreign key (departmentID)
      references db_school.department (id);
-- 引用/关联
#      on delete cascade  -- 级联删除
#      on delete set null;  -- 级联置空
select *
from db_school.student;
select *
from db_school.department;

desc db_school.student; -- desc: describe
desc db_school.department;

insert into db_school.department value (null, 'CS', '010-12345678');
insert into db_school.department value (null, 'SS', '010-12345679');
insert into db_school.department value (null, 'EE', '010-12345680');
delete
from db_school.department
where id = 2;

insert into db_school.student value (null, '001', 'male', 'Tom', 19, 1.75, '2000-01-23', 1);
insert into db_school.student value (null, '002', null, 'Jerry', 18, 1.65, '2001-01-23', 2);
insert into db_school.student (sno, name, age, height, dob, departmentID) value ('003', 'Tester', 18, 1.68, '2001-01-23', 3);
update db_school.student
set dob = '2000-3-1'
where name = 'tom';

update db_school.student
set gender = 'female', name = 'Jerry'
where id = 10000;

SELECT *
from db_school.student s
       inner join db_school.department d
                  on d.id = s.departmentID;
/*
drop table db_school.student;
drop table db_school.department;
drop database db_school;
*/
set foreign_key_checks = 0; -- 禁用外界约束
set foreign_key_checks = 1;