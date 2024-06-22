CREATE TABLE employee_info(
employee_id INT,
employee_Name VARCHAR(10),
Age INT,
Salary INT,
Tax INT);



INSERT INTO employee_info( employee_id,employee_Name,Age,Salary,Tax) VALUES(1, 'Jide',23,250000,5000);
INSERT INTO employee_info( employee_id,employee_Name,Age,Salary,Tax) VALUES(2, 'Segun',25,270000,6000);
INSERT INTO employee_info( employee_id,employee_Name,Age,Salary,Tax) VALUES(3, 'Joy',28,300000,8000);


select * from employee_info;

---Mathematical Operators in SQL---
--- Addition---
---instruction: Everyone gets a salary increase of 10000---
SELECT employee_id,employee_Name, Age, Salary, Salary+10000 AS "Salary_Increase" FROM employee_info;

---We can also add columns---
SELECT employee_id,employee_Name,Age,Salary , Salary+ Salary  AS "Column_Addition" FROM employee_info;

---Subtraction---
---instruction: Substract 2000 from the Salary---
SELECT employee_id,employee_Name,Age, Salary,Tax, Salary-2000 AS "Salary_deduction" FROM employee_info;
---Substract Tax from Salary---
SELECT employee_id,employee_Name, Age, Salary, Tax, Salary-Tax AS "Net_Salary" FROM employee_info;

---Multiplication---
---Multiply each Salary by 5%--
SELECT employee_id, employee_Name,Age,Salary,Tax, Salary*0.05 AS "5%Salary" FROM employee_info;
---Column Multiplication---
SELECT employee_id, employee_Name, Salary, Salary * employee_id AS Column_multiplication FROM employee_info

---Division---
SELECT employee_id, employee_Name, Age, Salary,Tax, Salary/26  AS Daily_wage from employee_info;
---Column Division---
SELECT employee_id, employee_Name, Age, Salary, Tax, Salary/employee_id AS Column_Division FROM employee_info;




