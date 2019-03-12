-- -------------------------------------------------
drop database if exists db_l;
create database db_l;

drop table if exists db_l.user;
create table db_l.user
(
  id       int auto_increment primary key comment 'id PK',
  username varchar(255) not null comment 'username NN',
  password varchar(255) not null comment 'password NN',
  role     int(1)       not null default 0 comment 'role 0-student 1-admin NN'
) comment 'user table';

drop table if exists db_l.book;
create table db_l.book
(
  id       int auto_increment primary key comment 'id PK',
  bookname varchar(255) not null comment 'bookname NN',
  bookloc  varchar(255) not null comment 'booklocation NN'
) comment 'book table';

drop table if exists db_l.borrow;
create table db_l.borrow
(
  id     int auto_increment primary key comment 'id PK',
  time   datetime not null default now() comment 'enroll time NN',
  userId int      not null comment 'user id FK',
  bookId int      not null comment 'book id FK'
) comment 'borrow table';

alter table db_l.borrow
  add constraint
    enroll_fk_userId
    foreign key (userId)
      references db_l.user (id);

alter table db_l.borrow
  add constraint
    enroll_fk_activityId
    foreign key (bookId)
      references db_l.book (id);

-- add admin
insert into db_l.user value (null, 'admin', md5('123'), 1);

-- admin sign in 'xxx', 'yyy'
select *
from db_l.user
where username = 'admin'
  and password = md5('123');

-- create
insert into db_l.book value (null, '西游记', '图书馆1层');
insert into db_l.book value (null, '水浒传', '图书馆2层');

-- delete
delete
from db_l.book
where id = 1;

-- update
update db_l.book
set bookname = '红楼梦',
    bookloc  = '图书馆3楼'
where id = 1;

-- retrieve
select *
from db_l.book;

-- student sign up
insert into db_l.user(username, password) value ('Tom', md5('abc'));
insert into db_l.user(username, password) value ('Jerry', md5('def'));
insert into db_l.user(username, password) value ('Tester', md5('ghi'));

-- student sign in 'xxx', 'yyy'
select *
from db_l.user
where username = 'jerry'
  and password = md5('def');

# delete from db_l.user;
# set foreign_key_checks = 0;
# set foreign_key_checks = 1;
# truncate db_l.user;

-- student borrow
insert into db_l.borrow(id, userId, bookId) value (null, 2, 1);

-- student sign in retrieve
select u.username, u.id, k.bookname, k.id, b.time
from db_l.user u
       inner join db_l.borrow b
                  on u.id = b.userId
       inner join db_l.book k
                  on b.bookId = k.id
where u.id = 2;

select *
from db_l.user;
select *
from db_l.book;
select *
from db_l.borrow;
