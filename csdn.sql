drop database if exists db_csdn;
create database db_csdn;

drop table if exists db_csdn.user;
create table db_csdn.user
(
  id       int auto_increment primary key comment 'id PK',
  username varchar(255) not null comment 'username NN',
  password varchar(255) not null comment 'password NN',
  email    varchar(255) not null comment 'email NN'
) comment 'user table';

load data local infile 'd:/csdn.txt'
  into table db_csdn.user
  fields terminated by '♥'
  (username, password, email)
  set id = null;

select count(*)
from db_csdn.user;

select *
from db_csdn.user;

-- 查询排名前十的密码
select password, count(password)
from db_csdn.user
group by password
order by 2 desc -- 2 代表 count(password)
limit 10 offset 0;

-- 查询排名前十的邮箱
select substring_index(email, '@', -1), count(substring_index(email, '@', -1))
from db_csdn.user
group by substring_index(email, '@', -1)
order by 2 desc
limit 10 offset 0;
