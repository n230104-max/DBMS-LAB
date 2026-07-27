USE taxation_db;
-- Creating table for tax payer
CREATE TABLE Taxpayer(
taxpayer_id INT PRIMARY KEY,
pan_number VARCHAR(10) NOT NULL UNIQUE,
full_name VARCHAR(100) NOT NULL,
date_of_birth DATE NOT NULL,
occupation VARCHAR(50) NOT NULL , 
annual_income DECIMAL(12,2) NOT NULL,
email VARCHAR(100) UNIQUE,
is_active BOOLEAN);
INSERT INTO Taxpayer(taxpayer_id,pan_number,full_name,date_of_birth,occupation,annual_income,email,is_active) VALUES
(101,'ABCDE1234F', 'Ravi Kumar', '1995-06-15', 'Software Engineer', 850000.00, 'ravi.kumar@example.com', TRUE),
(102,'BCDEF2345G', 'Priya Sharma','1992-11-22','Doctor',1200000.00,'priya.sharma@example.com',TRUE),
(103,'CDEFG3456H','Arjun Reddy','1988-03-10','Business Owner',1800000.00,'arjun.reddy@example.com',TRUE),
(104,'DEFGH4567J','Sneha Patel','1998-08-05','Teacher',620000.00,'sneha.patel@example.com',TRUE),
(105,'EFGHJ5678K','Kiran Rao','1990-01-18','Freelancer',750000.00,'kiran.rao@example.com',TRUE),
(106,'FGHJK6789L','Meera Singh','1985-12-30','Consultant',150000.00,'meera.singh@example.com',TRUE );
SELECT * FROM Taxpayer;

-- creating table for Income category

CREATE TABLE Income_category(
category_id INT PRIMARY KEY,
category_name VARCHAR(50) NOT NULL UNIQUE,
description VARCHAR(200) NOT NULL,
taxable BOOLEAN NOT NULL);
INSERT INTO Income_category() 
VALUES
(1,'Salary',' Income received from employment',TRUE),
(2,'Business', 'Income earned from business activities',TRUE),
(3,'House Property ','Income received from property or rent' ,TRUE),
(4,'Capital Gains ','Income from transfer of eligible assets', TRUE),
(5,'Other Sources','Income such as bank interest', TRUE),
(6,'Agriculture Income','Income from eligible agricultural activities ',TRUE);
SELECT*FROM Income_category;

-- creating table for financial year

CREATE TABLE Financial_year(
year_id INT PRIMARY KEY,
year_label VARCHAR(9) NOT NULL UNIQUE,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
filing_deadline DATE,
is_current BOOLEAN NOT NULL);
INSERT INTO Financial_year() VALUES
(1,'2020-2021','2020-04-01','2021-03-31','2021-07-31',FALSE),
(2,'2021-2022','2021-04-01','2022-03-31','2022-07-31',FALSE),
(3,'2022-2023','2022-04-01','2023-03-31','2023-07-31',FALSE),
(4,'2023-2024','2023-04-01','2024-03-31','2024-07-31',FALSE),
(5,'2024-2025','2024-04-01','2025-03-31','2025-07-31',FALSE),
(6,'2025-2026','2025-04-01','2026-03-31','2026-07-31',FALSE);
SELECT*FROM Financial_year;

-- creating table for income record

CREATE TABLE Income_record(
income_id INT PRIMARY KEY,
taxpayer_id INT NOT NULL,
income_source VARCHAR(100) NOT NULL,
category_name VARCHAR(50) NOT NULL,
amount DECIMAL(12,2) NOT NULL,
received_date DATE NOT NULL,
financial_year VARCHAR(9) NOT NULL);
INSERT INTO Income_record() 
VALUES
(1001,101,'TechNova Solutions', 'Salary', '850000.00' ,'2026-03-31','2025-2026'),
(1002, 102, 'City Care Hospital' ,'Salary', '1200000.00','2026-03-31' ,'2025-2026'),
(1003,103,'Reddy Enterprises', 'Business', '1800000.00' ,'2026-03-31', '2025-2026'),
(1004 ,104, 'Sunrise School', 'Salary','620000.00','2026-03-31','2025-2026'),
(1005,105,'Web Design Projects','Business','750000.00','2026-03-31','2025-2026'),
(1006,106,'Professional Consultanting','Business','1500000.00','2026-03-31','2025-2026');
SELECT * FROM Income_record;

-- inserting data in taxpayer 
INSERT INTO Taxpayer
VALUES
(107,'GHIJK7890M','Rahul Verma','1994-05-20','Engineer',900000.00,'rahul.verma@example.com',TRUE);
SELECT*FROM Taxpayer;

-- updating data in taxpayer
UPDATE Taxpayer
SET annual_income=950000.00
WHERE taxpayer_id=101;
SELECT*FROM Taxpayer;
UPDATE Taxpayer
SET occupation='Software consultant'
WHERE taxpayer_id=105;
SELECT*FROM Taxpayer;
UPDATE Taxpayer
SET is_active =TRUE
WHERE taxpayer_id=106;
SELECT*FROM Taxpayer;

-- deleting data in taxpayer
DELETE FROM Taxpayer
WHERE taxpayer_id = 107;
SELECT*FROM Taxpayer;

-- inserting data in income category
INSERT INTO Income_category
VALUES
(7,'Rental Income','Income Recieved from renting property',TRUE);
SELECT*FROM Income_category;

-- alterating table of taxpayer
ALTER TABLE Taxpayer
ADD phone_number VARCHAR(15);
SELECT*FROM Taxpayer;

-- alterating table of income record
ALTER TABLE Income_record
ADD remarks VARCHAR(200);
SELECT*FROM Income_record;

-- alterating table of taxpayer
ALTER TABLE Taxpayer
MODIFY occupation VARCHAR(100);
SELECT*FROM Taxpayer;

-- creating table of taxoffice
CREATE TABLE Tax_Office (
    office_id INT PRIMARY KEY,
    office_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

-- inserting data in tax office
INSERT INTO Tax_Office
VALUES
(1,'Hyderabad Tax Office','Hyderabad'),
(2,'Vijayawada Tax Office','Vijayawada');
SELECT * FROM Tax_Office;
TRUNCATE TABLE Tax_Office;
SELECT * FROM Tax_Office;
DROP TABLE Tax_Office; 

-- LAB-2
-- PART-A
-- Modifying data in income record
ALTER TABLE Income_record
DROP COLUMN category_name;
ALTER TABLE Income_record
DROP COLUMN financial_year;
SELECT*FROM Income_record;

-- inserting columns in income category
ALTER TABLE Income_record
ADD category_id INT,
ADD year_id INT;
SELECT*FROM Income_record;

-- creating foreign keys in income record
ALTER TABLE Income_record
ADD CONSTRAINT fk_taxpayer
FOREIGN KEY(taxpayer_id) REFERENCES Taxpayer(taxpayer_id);

ALTER TABLE Income_record
ADD CONSTRAINT fk_category
FOREIGN KEY(category_id) REFERENCES Income_category(category_id);


ALTER TABLE Income_record
ADD CONSTRAINT fk_year
FOREIGN KEY(year_id) REFERENCES Financial_year(year_id);
SELECT*FROM Income_record;

-- updating the records 
UPDATE Income_record SET category_id=1 WHERE income_id=1001;
UPDATE Income_record SET category_id=2 WHERE income_id=1002;
UPDATE Income_record SET category_id=3 WHERE income_id=1003;
UPDATE Income_record SET category_id=4 WHERE income_id=1004;
UPDATE Income_record SET category_id=5 WHERE income_id=1005;
UPDATE Income_record SET category_id=6 WHERE income_id=1006;

UPDATE Income_record SET year_id=01 WHERE income_id=1001;
UPDATE Income_record SET year_id=02 WHERE income_id=1002;
UPDATE Income_record SET year_id=03 WHERE income_id=1003;
UPDATE Income_record SET year_id=04 WHERE income_id=1004;
UPDATE Income_record SET year_id=05 WHERE income_id=1005;
UPDATE Income_record SET year_id=06 WHERE income_id=1006;
SELECT*FROM Income_record;

-- PART-B 
-- task-1
INSERT INTO income_record(income_id,taxpayer_id,income_source,amount, received_date,category_id,year_id) 
	VALUES(1007,999,'Influencer','50000.00','2026-07-20',2,6);
    -- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails 
    -- (taxation_database.income_record, CONSTRAINT foreign_taxpayer FOREIGN KEY (taxpayer_id) REFERENCES taxpayer (taxpayer_id))
    
-- task-2
INSERT INTO income_record(income_id,taxpayer_id,income_source,amount, received_date,category_id,year_id) 
	VALUES(1007,999,'Influencer','50000.00','2026-07-20',20,6);
	-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails 
    -- (taxation_database.income_record, CONSTRAINT foreign_taxpayer FOREIGN KEY (taxpayer_id) REFERENCES taxpayer (taxpayer_id))
    
-- task-3
INSERT INTO income_record(income_id,taxpayer_id,income_source,amount, received_date,category_id,year_id) 
	VALUES(1007,999,'Influencer','50000.00','2026-07-20',1,15);
    -- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails 
    -- (taxation_database.income_record, CONSTRAINT foreign_taxpayer FOREIGN KEY (taxpayer_id) REFERENCES taxpayer (taxpayer_id))
    
-- task-4 
INSERT INTO income_record(income_id,taxpayer_id,income_source,amount, received_date,category_id,year_id) 
	VALUES(1007,101,'Influencer','50000.00','2026-07-20',20,6);
    -- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails 
    -- (taxation_database.income_record, CONSTRAINT foreign_taxpayer FOREIGN KEY (taxpayer_id) REFERENCES taxpayer (taxpayer_id))
    
-- task-5
DELETE from income_category WHERE category_id=2;
 -- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails 
 -- (taxation_database.income_record, CONSTRAINT foreign_category FOREIGN KEY (category_id) REFERENCES income_category (category_id))

-- PART-C
SELECT DISTINCT occupation
FROM Taxpayer;

SELECT DISTINCT category_name
FROM Income_category;

SELECT DISTINCT year_id
FROM Financial_year;

SELECT DISTINCT income_source
FROM Income_record;

-- PART-D\

SELECT full_name
FROM Taxpayer
WHERE taxpayer_id IN(
SELECT taxpayer_id
FROM Income_record
WHERE category_id=1)
UNION

SELECT full_name
FROM Taxpayer
WHERE taxpayer_id IN(
SELECT taxpayer_id
FROM Income_record
WHERE category_id=4);

SELECT income_source
FROM Income_record
WHERE year_id=4

UNION

SELECT income_source
FROM Income_record
WHERE year_id=5;

SELECT full_name
FROM Taxpayer
WHERE occupation= 'Teacher'
UNION
SELECT full_name
FROM Taxpayer
WHERE occupation='Software Engineer';

-- PART-E 
SELECT full_name
FROM Taxpayer
WHERE taxpayer_id IN(
SELECT taxpayer_id
FROM Income_record
WHERE category_id=1
)
 HAVING 
 SELECT full_name
 FROM Taxpayer
 WHERE taxpayer__id IN(
 SELECT taxpayer_id
 FROM Income_record
 WHERE category_id=4
 );
 
 SELECT income_source
 FROM Income_record
 WHERE year_id=2
 INTERSECT
 SELECT income_source
 FROM Income_record
 WHERE year_id=5;
 
 -- PART-F
 SELECT full_name
 FROM Taxpayer
 WHERE taxpayer_id IN(
 SELECT taxpayer_id
 FROM Income_record
 WHERE category_id=2
 )
 EXCEPT
 SELECT full_name
 FROM Taxpayer
 WHERE taxpayer_id IN(
 SELECT taxpayer_id 
 FROM Income_record
 WHERE category_id=4
 );
 
 SELECT income_source
 FROM Income_record
 WHERE year_id=4
 EXCEPT
 SELECT income_source
 FROM Income_record
 WHERE year_id=3;
 
 -- PART-G
 -- TASK-1
 SELECT full_name
 FROM Taxpayer
 WHERE taxpayer_id IN (
 SELECT taxpayer_id
 FROM Income_record
 );
-- TASK-02
SELECT full_name
FROM Taxpayer
WHERE occupation IN(
SELECT occupation
FROM Taxpayer
WHERE taxpayer_id IN(
SELECT taxpayer_id
FROM Income_record
WHERE category_id=3
)
);
-- PART-H 
SELECT full_name
FROM Taxpayer
WHERE taxpayer_id NOT IN(
SELECT taxpayer_id
FROM Income_record
);

SELECT DISTINCT occupation
FROM Taxpayer
WHERE taxpayer_id NOT IN(
SELECT taxayer_id
FROM Income_record
);
SELECT taxpayer_id
FROM Taxpayer;
SELECT DISTINCT taxpayer_id
FROM Income_record;

-- PART-I

SELECT full_name
FROM Taxpayer
WHERE EXISTS(
SELECT*
FROM Income_record
WHERE Taxpayer.taxpayer_id = Income_Record.taxpayer_id
);
-- TASK-02
SELECT category_name
FROM Income_Category
WHERE NOT EXISTS (
    SELECT *
    FROM Income_Record
    WHERE Income_Category.category_id = Income_Record.category_id
);


-- PART-k 
-- TASK-1
SELECT full_name
FROM Taxpayer
WHERE annual_income > ANY (
    SELECT annual_income
    FROM Taxpayer
    WHERE occupation = 'Teacher'
);

-- TASK-2
SELECT full_name
FROM Taxpayer
WHERE annual_income > ANY (
    SELECT amount
    FROM Income_Record
    WHERE category_id = 2
);


-- PART-L 
-- TASK-01
SELECT full_name
FROM Taxpayer
WHERE annual_income > ALL (
    SELECT annual_income
    FROM Taxpayer
    WHERE occupation = 'Teacher'
);
-- TASK-02
SELECT full_name
FROM Taxpayer
WHERE annual_income > ALL (
    SELECT amount
    FROM Income_Record
    WHERE category_id = 2
);


-- PART-M
SELECT *
FROM taxpayer
ORDER BY full_name ASC;
	-- ASC ascending order (A → Z)
    
SELECT * FROM taxpayer WHERE annual_income>'800000.00';

SELECT * FROM taxpayer WHERE occupation='Software Engineer';

SELECT * FROM Income_Record WHERE income_id IN (1003,1004,1005);

SELECT * FROM income_record WHERE amount BETWEEN 500000 AND 1000000 ;

SELECT * FROM taxpayer WHERE full_name LIKE 'A%';

ALTER TABLE taxpayer ADD city varchar(20);
UPDATE taxpayer SET city='Vizag' WHERE taxpayer_id=101;
UPDATE Taxpayer SET city = 'Rajamundry' WHERE taxpayer_id IN (102,105);
UPDATE Taxpayer SET city = 'Tuni' WHERE taxpayer_id IN (103, 104,106);
SELECT * FROM taxpayer;

SELECT * FROM taxpayer WHERE is_active = 1;

SELECT COUNT(*) AS total_taxpayers FROM taxpayer;

SELECT MAX(amount) AS highest_income FROM income_record;


-- PART-N
SELECT t.full_name, i.amount 
FROM taxpayer t
JOIN income_Record i 
ON t.taxpayer_id = i.taxpayer_id
WHERE i.amount = (
    SELECT MAX(amount) 
    FROM income_record
);

SELECT c.category_name, COUNT(*) AS total_records
FROM Income_Record i
JOIN Income_Category c ON i.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_records DESC
LIMIT 1;

SELECT occupation, COUNT(*) AS total_taxpayers FROM Taxpayer GROUP BY occupation;

SELECT COUNT(*) AS active_taxpayers FROM Taxpayer WHERE is_active = 1;

SELECT year_id, COUNT(*) AS total_records
FROM Income_Record
GROUP BY year_id
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT * FROM income_record;
 
 



