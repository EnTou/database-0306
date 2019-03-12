-- -------------------------------------------------
drop database if exists db_a;
create database db_a;

drop table if exists db_a.user;
create table db_a.user
(
  id       int auto_increment primary key comment 'id PK',
  username varchar(255) not null comment 'username NN',
  password varchar(255) not null comment 'password NN',
  role     int(1)       not null default 0 comment 'role 0-student 1-admin NN'
) comment 'user table';

drop table if exists db_a.activity;
create table db_a.activity
(
  id    int auto_increment primary key comment 'id PK',
  title varchar(255) not null comment 'activity title NN'
) comment 'activity table';

drop table if exists db_a.enroll;
create table db_a.enroll
(
  id         int auto_increment primary key comment 'id PK',
  time       datetime not null default now() comment 'enroll time NN',
  userId     int      not null comment 'user id FK',
  activityId int      not null comment 'activity id FK'
) comment 'enroll table';

alter table db_a.enroll
  add constraint
    enroll_fk_userId
    foreign key (userId)
      REFERENCES db_a.user (id);

alter table db_a.enroll
  add constraint
    enroll_fk_activityId
    foreign key (activityId)
      references db_a.activity (id);

-- add admin
insert into db_a.user value (null, 'admin', md5('123'), 1);

-- admin sign in 'xxx', 'yyy'
select *
from db_a.user
where username = 'admin'
  and password = md5('123');

-- create
insert into db_a.activity value (null, '植物园一日游');
insert into db_a.activity value (null, '动物园一日游');

-- delete
delete
from db_a.activity
where id = 1;

-- update
update db_a.activity
set title = ''
where id = 1;

-- retrieve
select *
from db_a.activity;

-- student sign up
insert into db_a.user(username, password) value ('Tom', md5('abc'));
insert into db_a.user(username, password) value ('Jerry', md5('def'));
insert into db_a.user(username, password) value ('Tester', md5('ghi'));

-- student sign in 'xxx', 'yyy'
select *
from db_a.user
where username = 'jerry'
  and password = md5('def');

# delete from db_a.user;
# set foreign_key_checks = 0;
# set foreign_key_checks = 1;
# truncate db_a.user;

-- student enroll
insert into db_a.enroll(id, userId, activityId) value (null, 2, 1);
insert into db_a.enroll(id, userId, activityId) value (null, 3, 2);

-- admin sign in retrieve
select u.username, a.title
from db_a.user u
       inner join db_a.enroll e
                  on u.id = e.userId
       inner join db_a.activity a
                  on e.activityId = a.id;

select u.username, a.title
from db_a.user u
       inner join db_a.enroll e
                  on u.id = e.userId
       inner join db_a.activity a
                  on e.activityId = a.id
where a.id = 1;

select *
from db_a.user;
select *
from db_a.activity;
select *
from db_a.enroll;

