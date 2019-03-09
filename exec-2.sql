# 1. 返回拥有员工的部门名、部门号
select distinct d.DNAME, d.DEPTNO
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO = d.DEPTNO;
# 2. 工资多于 scott 的员工信息
select *
from scott.emp
where SAL > (select SAL from scott.emp where ENAME = 'scott');
# 3. 返回员工和所属经理的姓名?
select e.ENAME as '员工姓名', m.ENAME as '所属经理姓名'
from scott.emp e
       left outer join scott.emp m
                       on e.MGR = m.EMPNO;
# 4. 返回雇员的雇佣日期早于其经理雇佣日期的员工及其经理姓名
select e.ENAME, m.ENAME
from scott.emp e
       inner join scott.emp m
                  on e.MGR = m.EMPNO
where e.HIREDATE < m.HIREDATE;
# 5. 返回员工姓名及其所在的部门名称
select e.ENAME, d.DNAME
from scott.emp e
       join scott.dept d
            on e.DEPTNO = d.DEPTNO;
# 6. 返回从事 clerk 工作的员工姓名和所在部门名称
select e.ENAME, d.DNAME
from scott.emp e, scott.dept d
where e.DEPTNO = d.DEPTNO and e.JOB = 'clerk';
# 7. 返回部门号及其本部门的最低工资
# 8. 返回销售部 sales 所有员工的姓名
# 9. 返回工资多于平均工资的员工
# 10. 返回与 scott 从事相同工作的员工
# 11. 返回比 30 部门员工平均工资高的员工姓名与工资
# 12. 返回工资高于30部门所有员工工资的员工信息
# 13. 返回部门号、部门名、部门所在位置及其每个部门的员工总数
# 14. 返回员工的姓名、所在部门名及其工资
# 15. 返回雇员表中不在同一部门但是从事相同工作的员工信息
# 16. 返回员工的详细信息，包括部门名
# 17. 返回员工工作及其从事此工作的最低工资
# 18. 返回不同部门经理的最低工资
# 19. 计算出员工的年薪，并且以年薪排序
# 20. 返回工资处于第 4 级别的员工的姓名
