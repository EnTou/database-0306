drop database if exists db_ip;
create database db_ip;

drop table if exists db_ip.ip;
create table db_ip.ip(
  id int auto_increment primary key comment 'id PK',
  min varchar(255) not null comment 'min ip NN',
  max varchar(255) not null comment 'max ip NN',
  loc varchar(255) not null comment 'location NN'
)comment 'ip address table';

select *
from db_ip.ip;

load data local infile 'd:/ip.txt'
into table db_ip.ip
fields terminated by '|'
  (min, max, loc)
set id = null;

select *
from db_ip.ip;

select count(*)
from db_ip.ip;  -- 统计数据量

update db_ip.ip
set min = trim(min),  -- 修整
    max = trim(max),
    loc = trim(loc);

-- 166.111.3.207
-- SQL ?