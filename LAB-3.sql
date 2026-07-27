-- PART-A 

USE  taxation_db;
SHOW TABLES;
SELECT*FROM Taxpayer;
SELECT*FROM Income_category;
SELECT*FROM Financial_year;
SELECT*FROM Income_record;

-- PART-B
     -- LEVEL-1
SELECT UPPER(full_name)  AS Full_name FROM Taxpayer;
SELECT LOWER(occupation) AS Occupation FROM Taxpayer;
SELECT LENGTH(full_name) AS Name_length FROM Taxpayer;
SELECT LEFT(pan_number,4) AS Pan_start FROM Taxpayer;
SELECT CONCAT(full_name,'-',occupation) AS Details FROM Taxpayer;

     -- LEVEL-2
SELECT REPLACE(category_name,'Income','Inc.') AS Category FROM Income_category;
SELECT TRIM(full_name) AS Taxpayer_name FROM Taxpayer;
SELECT LEFT (full_name,LOCATE('',full_name)-1) AS First_name FROM Taxpayer;

   --  LEVEL-3
   SELECT CONCAT('Taxpayer:',full_name,'\n Occupation:',occupation) FROM Taxpayer;
   SELECT *FROM Taxpayer WHERE pan_number LIKE 'AP%';

-- PART-C
   -- LEVEL-1
SELECT ROUND(annual_income) FROM Taxpayer;
SELECT ABS(annual_income-500000) FROM Taxpayer;
SELECT POWER(annual_income,2) FROM Taxpayer;

   -- LEVEL-2
SELECT MOD(annual_income,1000) FROM Taxpayer;
SELECT ROUND(annual_income,2) FROM Taxpayer;
SELECT CEIL(annual_income), FLOOR(annual_income) FROM Taxpayer;

   -- level-3
SELECT FLOOR(RAND()*100)+1;
SELECT SQRT(annual_income) FROM Taxpayer;
SELECT annual_income,annual_income*1.10 FROM Taxpayer;

-- PART-D
   -- LEVEL-1
SELECT CURDATE();
SELECT NOW();
SELECT YEAR(start_date) FROM Financial_year;
SELECT MONTH(start_date) FROM Financial_year;
SELECT DAY(start_date) FROM Financial_year;
  
    -- LEVEL-2
SELECT DATE_ADD(start_date,INTERVAL 1 YEAR) FROM Financial_year;
SELECT DATE_ADD(start_date,INTERVAL 30 DAY) FROM Financial_year;
SELECT DATE_SUB(start_date,INTERVAL 7 DAY) FROM Financial_year;

    -- LEVEL-3
SELECT DATEDIFF(CURDATE(),start_date) FROM Financial_year;
SELECT * FROM Financial_year WHERE YEAR(start_date)=YEAR(CURDATE());

-- PART-E 
      -- LEVEL-1
SELECT CAST(annual_income AS SIGNED) FROM Taxpayer;
SELECT CAST(taxpayer_id AS CHAR) FROM Taxpayer;
  
    -- LEVEL-2
SELECT CAST(start_date AS DATETIME) FROM Financial_year;
SELECT CAST(annual_income AS DECIMAL(10,2)) FROM Taxpayer;

   -- LEVEL-3
SELECT CAST(annual_income AS CHAR) FROM Taxpayer;
SELECT annual_income, CAST(annual_income AS DECIMAL(10,2))*0.10 AS TAX FROM Taxpayer;