# noinspection SqlWithoutWhereForFile

select *
from db_school.student;



delete
from db_school.student;

show full columns from db_school.student;

show full tables from db_school;

show variables like 'c%';

select *
from scott.emp;


select EMPNO,
       HIREDATE -- 投影
from scott.emp;

select distinct JOB
from scott.emp;

select *
from scott.emp
     # where SAL > 2000;
     # where SAL <> 3000;
     # where SAL <> 3000 and JOB <> 'salesman';
where SAL <> 3000
   or JOB <> 'salesman';

-- ci: case insensitive
select *
from scott.emp
where ENAME = binary 'Scott'; -- 区分大小写

select JOB, ENAME, HIREDATE
from scott.emp
     # order by ENAME asc; -- ascend default 升序
     # order by ENAME desc; -- descend       降序
     # order by ENAME;
     # order by HIREDATE; -- 工龄长的在前？后？
order by JOb, ENAME desc;


select comm
from scott.emp
order by COMM;

select *
from scott.emp
limit 3 offset 0;
-- offset 偏移量 可读性强
# limit 0, 3; -- 不建议

-- limit 一般位于 order by 之后

# SQL LIKE 模糊查询
select ENAME
from scott.emp
where ENAME like 'a%s'; -- 以a开头，以s结尾的员工姓名

select ENAME
from scott.emp
where ENAME not like 'a%s'; -- 不以a开头，或不以s结尾的员工姓名

select ENAME
from scott.emp
where ENAME like '%COTT';

select ENAME
from scott.emp
where ENAME like '_COTT'; -- '_':一个任意字符


select ENAME
from scott.emp
where ENAME like '%\_%' escape '\\'; -- 查到%_%的人
select ENAME
from scott.emp
where ENAME like '%_%'; -- 查到所有的员工名

update scott.emp
set ENAME = 'sco_tt'
where ENAME = 'scott';

select *
from scott.emp;

select *
from scott.emp
     # where JOB = 'salesman' or JOB = 'manager' or JOB = 'president';
where JOB in ('salesman', 'manager', 'president');

select *
from scott.emp
     # where SAL >= 2000 and SAL <= 3000; -- [2000,3000]
where SAL between 2000 and 3000;

select ENAME as '员工姓名' -- as： alias 取别名
from scott.emp;

select e.ENAME as '员工姓名'
from scott.emp as e;

select *
from scott.emp
where COMM is null; -- 判空
select *
from scott.emp
where COMM is not null; -- 判非空

update scott.emp
set COMM = null -- 空值设置用 = 号
where ENAME = '7499'; -- DML

select ENAME,
       SAL + ifnull(COMM, 0) -- 奖金不为空： 工资+奖金； 奖金为空：工资+0
from scott.emp;


select *
from scott.emp;

select *
from scott.dept;

select e.ENAME, e.DEPTNO, d.DNAME, d.DEPTNO
from scott.emp e
       inner join scott.dept d -- 可以省略 inner        cross join：交叉连接
                  on e.DEPTNO = d.DEPTNO;
-- 少了king
-- 52 = 13 * 4

-- 在内连接的基础上，显示落选信息：
select e.ENAME, d.DNAME
from scott.emp e
       left outer join scott.dept d -- 可以省略 outer
                       on e.DEPTNO = d.DEPTNO;
select e.ENAME, d.DNAME
from scott.dept d
            right join scott.emp e
                       on e.DEPTNO = d.DEPTNO; -- KING

select e.ENAME, d.DNAME
from scott.dept d
       right join scott.emp e
                  on e.DEPTNO = d.DEPTNO -- KING
union  -- all
select e.ENAME, d.DNAME
from scott.emp e
       right join scott.dept d
                  on e.DEPTNO = d.DEPTNO; -- OPERATIONS

select e.ENAME, e.DEPTNO, d.DNAME, d.DEPTNO
from scott.emp e
       join scott.dept d
#                           on e.DEPTNO = d.DEPTNO;
            using (deptno); -- 主外键相同可以用using



