drop database if exists db_ec;
create database db_ec;

-- user table
drop table if exists db_ec.user;
create table db_ec.user
(
  id       int auto_increment primary key comment 'id PK',
  email    varchar(255) not null unique comment 'email NN UN',
  password varchar(255) not null comment 'password NN',
  mobile   varchar(255) not null unique comment 'mobile NN UN'
) comment 'user table';

drop table if exists db_ec.user_info;
create table db_ec.user_info
(
  id     int auto_increment primary key comment 'id PK',
  avatar varchar(255) comment 'avatar', -- ''150... .jpg
  gender varchar(2) comment 'gender',
  city   varchar(255) comment 'city',
  userId int comment 'user id FK'
) comment 'user info table';

-- category table
drop table if exists db_ec.category;
create table db_ec.category(
  id int auto_increment primary key comment 'id PK',
  title varchar(255) not null comment 'title NN',
  picture varchar(255) comment 'category picture',
  categoryId int comment 'parent category id FK'
)comment 'category table';

-- product table
drop table if exists db_ec.product;
create table db_ec.product
(
  id     int auto_increment primary key comment 'id PK',
  title varchar(255) not null comment 'title NN',
  price  decimal(8,2) not null comment ' price NN',
  originalPrice decimal(8,2) comment 'original price',
  -- slidePictures text not null comment 'slide pictures NN',  -- '1.jpg 2.jpg 3.jpg 4.jpg 5.jpg'
  -- detail pictures ?
  categoryId int comment 'category id FK'
) comment 'product table';

-- pictures table
drop table if exists db_ec.pictures;
create table db_ec.pictures(
  id int auto_increment primary key comment 'id PK',
  title varchar(255) not null unique comment 'title NN UN',
  type int(1) not null comment 'type: 1-slide picture 2-detail picture',
  productId int comment 'product id FK'
)comment 'pictures table';


alter table db_ec.user_info
  add constraint
    user_info_fk_userId     -- table name_fk_column    fk_table name_column
    foreign key (userId)
      references db_ec.user (id);

alter table db_ec.category
  add constraint
    user_info_fk_categoryId
    foreign key (categoryId)
      references db_ec.category (id);

alter table db_ec.product
  add constraint
    user_info_fk_categoryId
    foreign key (categoryId)
      references db_ec.category (id);

alter table db_ec.pictures
  add constraint
    user_info_fk_productId
    foreign key (productId)
      references db_ec.product (id);


select *
from db_ec.user;

select *
from db_ec.user_info;

select *
from db_ec.category;

select *
from db_ec.product;

select *
from db_ec.pictures;


drop table if exists db_ec.order;
create table db_ec.order
(
  id     int auto_increment primary key comment 'id PK'
) comment 'order table';

insert into db_ec.user value (null,'Tom@163.com', '123', '13123456789' );

