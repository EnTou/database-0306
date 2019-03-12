show index from scott.emp;
-- MySQL, Primary key & Foreign key 默认为索引
-- 索引增加查询速度，降低更新和删除速度

create index idx_ename on scott.emp(ENAME);

drop index idx_ename on scott.emp;

select ENAME
from scott.emp;

-- 如果 index 只有好处，没有必要存在这个概念
create index idx_password on db_csdn.uesr(password);  -- 434176 KB  -> 581632 KB
create index idx_username on db_csdn.uesr(username);
create index idx_email on db_csdn.uesr(email);
show index from db_csdn.uesr;

select password, count(password)
from db_csdn.uesr
group by password
order by 2 desc -- 2 代表 count(password)
limit 10 offset 0;

select *
from db_csdn.uesr
where password rlike '';

select *
from db_csdn.uesr
where password like '';

select md5('123');


