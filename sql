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

SQL Cheat Sheet: CREATE TABLE, ALTER, DROP, TRUNCATE
Command	Syntax	Description	Example
CREATE TABLE	MySQL/DB2:  CREATE TABLE table_name (col1 datatype optional keyword, col2 datatype optional keyword,col3 datatype optional keyword,..., coln datatype optional keyword) 	
CREATE TABLE statement is to create the table. Each column in the table is specified with its name, data type and an optional keyword which could be PRIMARY KEY, NOT NULL, etc.,	MySQL/DB2:  
CREATE TABLE employee ( employee_id char(2) PRIMARY KEY, first_name varchar(30) NOT NULL, mobile int);

ALTER TABLE - ADD COLUMN	MySQL/DB2:
Option 1. ALTER TABLE table_name ADD column_name_1 datatype....ADD COLUMN column_name_n datatype; 
Option 2. ALTER TABLE table_name ADD COLUMN column_name_1 datatype....ADD COLUMN column_name_n datatype; 

ALTER TABLE statement is used to add the columns to a table.	MySQL/DB2
 Option 1. ALTER TABLE employee ADD income bigint;

 Option 2. ALTER TABLE employee ADD COLUMN income bigint;

ALTER TABLE - ALTER COLUMN	MySQL:  ALTER TABLE table_name MODIFY COLUMN column_name_1 new_data_type;
DB2: ALTER TABLE table_name ALTER COLUMN column_name_1 SET DATA TYPE datatype;

MySQL: ALTER TABLE MODIFY COLUMN  MODIFY COLUMN clause is used with the ALTER TABLE statement to modify the data type of columns.
Db2: ALTER TABLE ALTER COLUMN  statement is used to modify the data type of columns.

MySQL: ALTER TABLE employee MODIFY COLUMN mobile SET DATA TYPE CHAR(20);
DB2: ALTER TABLE employee ALTER COLUMN mobile SET DATA TYPE CHAR(20);

ALTER TABLE - DROP COLUMN	MySQL/DB2:  ALTER TABLE table_name DROP COLUMN column_name_1 ;	ALTER TABLE DROP COLUMN  statement is used to remove columns from a table.	MySQL/DB2:
ALTER TABLE employee DROP COLUMN mobile ;

ALTER TABLE - RENAME COLUMN	MySQL:ALTER TABLE table_name CHANGE COLUMN current_column_name new_column_name datatype [optional keywords];
DB2: ALTER TABLE table_name RENAME COLUMN current_column_name TO new_column_name;

MySQL: ALTER TABLE CHANGE COLUMN  CHANGE COLUMN clause is used to rename the columns in a table.
DB2: ALTER TABLE RENAME COLUMN  statement is used to rename the columns in a table.

MySQL: ALTER TABLE employee CHANGE COLUMN first_name name VARCHAR(255);
DB2: ALTER TABLE employee RENAME COLUMN first_name TO name;

TRUNCATE TABLE	MySQL: TRUNCATE TABLE table_name;
DB2: TRUNCATE TABLE table_name IMMEDIATE;

MySQL: TRUNCATE TABLE statement is used to delete all of the rows in a table.
Db2: The IMMEDIATE specifies to process the statement immediately and that it cannot be undone.

MySQL: TRUNCATE TABLE employee;
DB2: TRUNCATE TABLE employee IMMEDIATE ;

DROP TABLE	MySQL/DB2DROP TABLE table_name ;	Use the DROP TABLE statement to delete a table from a database. If you delete a table that contains data, by default the data will be deleted alongside the table.	MySQL/DB2:
DROP TABLE employee ;

