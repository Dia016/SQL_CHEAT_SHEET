SQL Cheat Sheet: Basics


Command	Syntax	Description	Example
SELECT	SELECT column1, column2, ... FROM table_name; 	SELECT statement is used to fetch data from a database.	SELECT city FROM placeofinterest;

WHERE	SELECT column1, column2, ...FROM table_name WHERE condition;	WHERE clause is used to extract only those records that fulfill a specified condition.	SELECT * FROM placeofinterest WHERE city == 'Rome' ;

COUNT	SELECT COUNT * FROM table_name ; 	COUNT is a function that takes the name of a column as argument and counts the number of rows when the column is not NULL.	SELECT COUNT(country) FROM placeofinterest WHERE country='Canada';

DISTINCT	SELECT DISTINCT columnname FROM table_name;	DISTINCT function is used to specify that the statement is a query which returns unique values in specified columns.	SELECT DISTINCT country FROM placeofinterest WHERE type='historical';

LIMIT	SELECT * FROM table_name LIMIT number;	LIMIT is a clause to specify the maximum number of rows the result set must have.	SELECT * FROM placeofinterest WHERE airport="pearson" LIMIT 5;

INSERT	INSERT INTO table_name (column1,column2,column3...) VALUES(value1,value2,value3...); 	INSERT is used to insert new rows in the table.	INSERT INTO placeofinterest (name,type,city,country,airport) VALUES('Niagara Waterfalls','Nature','Toronto','Canada','Pearson');

UPDATE	UPDATE table_name SET[[column1]=[VALUES]] WHERE [condition];	UPDATE used to update the rows in the table.	UPDATE placeofinterest SET name = 'Niagara Falls' WHERE name = "Niagara Waterfalls";

DELETE	DELETE FROM table_name WHERE [condition]; 	DELETE statement is used to remove rows from the table which are specified in the WHERE condition.	DELETE FROM placeofinterest WHERE city IN ('Rome','Vienna');

SQL Scripts - Uses and Applications
SQL Scripts
SQL scripts are a series of commands or a program that will be executed on an SQL server.

SQL scripts are useful for making complex database changes and can be used to create, modify, or delete database objects such as tables, views, stored procedures, and functions.

Applications of SQL Scripts
Here are some of the things that you can do with SQL scripts:

Create tables
You can use SQL scripts to create new tables in your database. This is useful when you need to add new functionality to your application or when you want to store new types of data.

Drop tables
SQL scripts often have commands to Drop tables from databases. This is especially important before Create table commands to make sure that a table with the same name doesnt exist in the database already.

Insert data
SQL scripts can also be used to insert data into your tables. This is useful when you need to populate your database with test data or when you want to import data from an external source.

Update data
You can use SQL scripts to update existing data in your tables. This is useful when you need to correct errors or update records based on changing business requirements.

Delete data
SQL scripts can also be used to delete data from your tables. This is useful when you need to remove old or obsolete records from your database.

Create views
Views are virtual tables that allow you to query data from multiple tables as if they were a single table. You can use SQL scripts to create views that simplify complex queries and make it easier to work with your data.

Create stored procedures
Stored procedures are precompiled SQL statements that can be executed on demand. You can use SQL scripts to create stored procedures that encapsulate complex business logic and make it easier to manage your database.

Create triggers
Triggers are special types of stored procedures that are automatically executed in response to certain events, such as an insert, update, or delete operation. You can use SQL scripts to create triggers that enforce business rules and maintain data integrity.

Example: Creating Tables
Let us execute a script containing the CREATE TABLE commands for all the tables in a given dataset, rather than create each table manually by typing the DDL commands in the SQL editor.

Note the following points about these scripts.

SQL scripts are basically a set of SQL commands compiled in a single file.
Each command must be terminated with a delimiter or terminator. Most often, the default delimiter is a semicolon ;.
It is advisable to keep the extension of the file as .sql.
Upon importing this file in the phpMyAdmin interface, the commands in the file are run sequentially.
Consider the following script


DROP TABLE IF EXISTS PATIENTS;
DROP TABLE IF EXISTS MEDICAL_HISTORY;
DROP TABLE IF EXISTS MEDICAL_PROCEDURES;
DROP TABLE IF EXISTS MEDICAL_DEPARTMENTS;
DROP TABLE IF EXISTS MEDICAL_LOCATIONS;
CREATE TABLE PATIENTS (
  PATIENT_ID CHAR(9) NOT NULL,
  FIRST_NAME VARCHAR(15) NOT NULL,
  LAST_NAME VARCHAR(15) NOT NULL,
  SSN CHAR(9),
  BIRTH_DATE DATE,
  SEX CHAR,
  ADDRESS VARCHAR(30),
  DEPT_ID CHAR(9) NOT NULL,
  PRIMARY KEY (PATIENT_ID)
);
CREATE TABLE MEDICAL_HISTORY (
  MEDICAL_HISTORY_ID CHAR(9) NOT NULL,
  PATIENT_ID CHAR(9) NOT NULL,
  DIAGNOSIS_DATE DATE,
  DIAGNOSIS_CODE VARCHAR(10),
  MEDICAL_CONDITION VARCHAR(100),
  DEPT_ID CHAR(9),
  PRIMARY KEY (MEDICAL_HISTORY_ID)
);
CREATE TABLE MEDICAL_PROCEDURES (
  PROCEDURE_ID CHAR(9) NOT NULL,
  PROCEDURE_NAME VARCHAR(30),
  PROCEDURE_DATE DATE,
  PATIENT_ID CHAR(9) NOT NULL,
  DEPT_ID CHAR(9),
  PRIMARY KEY (PROCEDURE_ID)
);
CREATE TABLE MEDICAL_DEPARTMENTS (
  DEPT_ID CHAR(9) NOT NULL,
  DEPT_NAME VARCHAR(15),
  MANAGER_ID CHAR(9),
  LOCATION_ID CHAR(9),
  PRIMARY KEY (DEPT_ID)
);
CREATE TABLE MEDICAL_LOCATIONS (
  LOCATION_ID CHAR(9) NOT NULL,
  DEPT_ID CHAR(9) NOT NULL,
  LOCATION_NAME VARCHAR(50),
  PRIMARY KEY (LOCATION_ID, DEPT_ID)
);
