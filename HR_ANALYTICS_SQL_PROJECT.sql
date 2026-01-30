CREATE DATABASE HR_ANALYTICS;

USE HR_ANALYTICS;


# CREATE TABLE EMPLOYEE


CREATE TABLE employee (
  emp_id VARCHAR(10) PRIMARY KEY,
  name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  department VARCHAR(30),
  job_role VARCHAR(30),
  joining_date DATE,
  salary DECIMAL(10,2)
);

# CREATE TABLE PERFORMANCE

CREATE TABLE performance (
  emp_id VARCHAR(10),
  review_year INT,
  performance_rating INT,
  FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);



# CREATE TABLE ATTRITION


CREATE TABLE attrition (
  emp_id VARCHAR(10),
  attrition VARCHAR(5),
  exit_date DATE,
  reason VARCHAR(50),
  FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);


SELECT * FROM EMPLOYEE;
SELECT * FROM PERFORMANCE;
SELECT * FROM ATTRITION;



# CALCULATE ATTRITION RATE

SELECT 
ROUND(SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*)*100,2) AS attrition_rate
FROM attrition;

#  CALCULATE DEPARTMENT WISE ATTRITION

SELECT e.department,
COUNT(a.emp_id) AS attrition_count
FROM employee e
JOIN attrition a ON e.emp_id=a.emp_id
WHERE a.attrition='Yes'
GROUP BY e.department;


# AVERAGE SALARY BY DEPARTMENT

SELECT department,
AVG(salary) AS avg_salary
FROM employee
GROUP BY department;


# CALCULATE Experience (tenure) calculation

SELECT emp_id, name,
TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) AS experience_years
FROM employee;




