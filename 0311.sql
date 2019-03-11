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