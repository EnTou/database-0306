/*
db_school

1NF
department
id, title, tel,       mobile
1, CS, 010-12345678,  18612345678

2NF                             3NF
student
id,   sno, name, gender, age, deptName, tel
1.    null, Tom,  male,   18, CS,       010...
2.    002, Jerry, female, 18, CS,       010...
3.    null, Tom,  male,   18, CS,       010...

id,   sno, name, gender, age, deptId(FK)
1.    null, Tom,  male,   18, 1
2.    002, Jerry, female, 18, 1
3.    null, Tom,  male,   18, 1

 */


