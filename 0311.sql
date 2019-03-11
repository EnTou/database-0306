create table scott.new_emp
select *
from scott.emp; -- 用于简单的备份表

select *
from scott.new_emp;

delete
from scott.new_emp;

drop table scott.new_emp;

insert into scott.new_emp
  (EMPNO, ENAME, DEPTNO)
select EMPNO, ENAME, DEPTNO
from scott.emp;

create or replace view scott.v_emp
as
select ename, empno, job, DEPTNO
from scott.emp
where DEPTNO = 30; -- 视图内容来自查询语句

select *
from scott.new_emp;

select ENAME, DNAME
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO = d.DEPTNO
where ENAME = 'allen';

create or replace view scott.v_name
as
select e.EMPNO, e.ENAME, d.DNAME
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO = d.DEPTNO;

select *
from scott.v_name
where ENAME = 'allen';

-- install
-- conf
-- basic
-- dialect

-- sal 大于 scott 员工 sal?
select *
from scott.emp
where ENAME = 'scott';

select *
from scott.emp
where sal > (
  select SAL
  from scott.emp
  where ENAME = 'scott'
); -- sub query 子查询

start transaction;
-- DMLs
delete
from scott.emp
where ENAME = 'jones';

savepoint a;  -- 设置保留点

update scott.emp
set SAL = 2000
where name = 'martin';

savepoint b;

delete
from scott.emp;

select *
from scott.emp;

rollback to b;  -- 结束事务？ 不结束
rollback to a;

rollback; -- 回滚 -- 回到事务开始之初
commit;
-- 提交 -- 结束事务

-- DDL 可以隐式提交一次事务 create drop alter
create table scott.test
(
  if int
);

set autocommit = 0; -- 不自动提交
set autocommit = 1; -- 默认 自动提交

select DEPTNO, avg(sal)
# select sum(sal)
# select min(sal), max(sal)
# select count(*)
# select min(ename), max(ename)
# select sum(ename)
from scott.emp
group by DEPTNO;  -- 列值相同的分为一组

select JOB, max(HIREDATE)
from scott.emp
group by JOB
having JOB in ('clerk', 'manager'); -- 组检索 / where 行检索 / 投影 列检索

