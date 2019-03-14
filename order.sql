drop table if exists db_ec.order;
create table db_ec.order
(
  id       int auto_increment primary key comment 'id PK',
  title    varchar(255)  not null comment 'product title NN',
  number   int(8)        not null comment 'product number NN',
  price    decimal(8, 2) not null comment 'product price NN',
  total    decimal(8, 2) not null comment 'total price NN',
  createTm datetime default null comment 'order create time',
  updateTm datetime default null comment 'order update time'
) comment 'order table';