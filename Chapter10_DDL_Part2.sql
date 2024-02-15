---Chapter 10 -- DDL -- Data Definition Language

---CREATE , ALTER, DROP


---COMPLEX Constraint


CREATE TABLE Video
(v_id INT,
 v_copy INT,
 v_name VARCHAR(20) NOT NULL,
 CONSTRAINT video_id_copy_pk PRIMARY KEY(v_id,v_copy)

);

INSERT INTO video
VALUES (1,1,'A'),
		(1,2,'A'),
		(1,3,'A'),
		(2,1,'B'),
		(2,2,'B'),
		(2,3,'B');

INSERT INTO video
VALUES (2,1,'B')


SELECT *
FROM video

SELECT * FROM dep;
SELECT * FROM emp;


/*
ALTER TABLE tablename
ADD|ALTER|DROP COLUMN|CONSTRAINT

*/

ALTER TABLE emp
ADD Phone VARCHAR(10) 


SELECT * FROM emp;


UPDATE emp
SET phone = '0235877'
WHERE empid = 1

---String or binary data would be truncated in table 'DemoDB.dbo.Emp', column 'Phone'. Truncated value: '0235877654'.

UPDATE emp
SET phone = '02358776543'
WHERE empid = 2


ALTER TABLE emp
ALTER COLUMN Phone VARCHAR(15)


UPDATE emp
SET phone = '0235877654335'
WHERE empid = 2


SELECT *,LEN(PHONE) 
FROM emp;

---String or binary data would be truncated in table 'DemoDB.dbo.Emp', column 'Phone'. Truncated value: ''.

ALTER TABLE emp
ALTER COLUMN Phone VARCHAR(10)



ALTER TABLE emp
ALTER COLUMN Phone VARCHAR(13)

ALTER TABLE emp
DROP COLUMN Phone;


ALTER TABLE emp
ADD Phone VARCHAR(10)


SELECT * FROM EMP;

ALTER TABLE emp
ADD CONSTRAINT emp_phone_ck CHECK(LEN(PHONE)>=5);


--The UPDATE statement conflicted with the CHECK constraint "emp_phone_ck". The conflict occurred in database "DemoDB", table "dbo.Emp", column 'Phone'.

UPDATE emp
SET phone = '235'
WHERE empid = 1;


UPDATE emp
SET phone = '23523'
WHERE empid = 1;



ALTER TABLE emp
DROP  CONSTRAINT emp_phone_ck ;


UPDATE emp
SET phone = '235'
WHERE empid = 2;


-----Copy Table


SELECT *
INTO copy_emp
FROM emp;


SELECT *
from copy_emp;


insert into copy_emp
SELECT *
FROM emp;



INSERT INTO copy_emp
SELECT EmpName
,BirthDate
,HireDate
,Email
,Salary
,DepID
,Phone
FROM emp;




SELECT *
from copy_emp;


INSERT INTO copy_emp(EmpName,BirthDate,HireDate,Email,Salary,DepID,Phone)
SELECT LastName,BirthDate , HireDate,LastName+'@gmail.com',10000,NULL,NULL
FROM Northwind.dbo.Employees
WHERE ReportsTo=2


SELECT empid, EmpName,salary ,depid
INTO copy2
FROM copy_emp;


SELECT *
FROM copy2;



SELECT empid, EmpName,salary ,depid , '0489340' AS Fax
INTO copy3
FROM copy_emp;


select *
from COPY3


SELECT empid, EmpName,salary ,depid , 5000 AS Bonus
INTO copy4
FROM copy_emp;

SELECT empid, EmpName,salary ,depid , null AS Bonus
INTO copy5
FROM copy_emp;


SELECT empid, EmpName,salary ,depid , 5000.00 AS Bonus
INTO copy6
FROM copy_emp;


ALTER TABLE copy6
ALTER COLUMN bonus MONEY;



SELECT *
INTO copy7
FROM copy_emp
WHERE salary >=20000;


SELECT *
from  copy7



SELECT *
INTO copy8
FROM copy_emp
WHERE 1=2;



SELECT *
from copy8



SELECT Empid AS ID
,EmpName
,Salary AS SAL
,DepID
,Phone
INTO copy9
FROM copy_emp
WHERE 1=2;



---TEMP Table

SELECT *
INTO #tbl
FROM copy_emp;


SELECT *
INTO #tbl
FROM Northwind..[Order Details]; --default owner dbo


SELECT *
FROM #tbl;


delete from #tbl
where discount=0;


update #tbl
set unitprice = 30
where unitprice<=10



go

select user

go

use DemoDB

go


CREATE SCHEMA HR

CREATE TABLE HR.employees
(id int)


CREATE TABLE employees
(id int)

---Cannot drop schema 'hr' because it is being referenced by object 'employees'.

drop schema hr


---SYSTEM TABLES


SELECT *
FROM SYS.objects


SELECT *
FROM SYS.tables



SELECT *
FROM SYS.columns



SELECT *
FROM SYS.columns
WHERE name ='id'


SELECT C.NAME, T.name
FROM SYS.columns c join sys.tables t
ON C.object_id = T.object_id
WHERE C.name ='id'



SELECT * FROM SYS.schemas


SELECT *
FROM SYS.tables