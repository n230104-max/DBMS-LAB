  -- PART-A 
  
USE taxation_db;
SHOW TABLES;

  -- SQL JOIN OPERATIONS
      -- LEVEL-1
SELECT t.full_name,i.income_source FROM Taxpayer t
INNER JOIN Income_record i ON t.taxpayer_id=i.taxpayer_id;

SELECT t.full_name,c.category_name FROM Taxpayer t 
INNER JOIN Income_record i ON t.taxpayer_id=i.taxpayer_id
INNER JOIN Income_category c ON i.category_id=c.category_id;

SELECT i.income_source,i.income_id,f.year_label FROM Income_record i 
INNER JOIN Financial_year f ON i.year_id=f.year_id;

SELECT t.full_name,t.annual_income,i.amount FROM Taxpayer t 
INNER JOIN Income_record i ON t.taxpayer_id=i.taxpayer_id;

SELECT t.full_name,i.income_source,c.category_name,f.year_label FROM Taxpayer t 
INNER JOIN Income_record i ON t.taxpayer_id=i.taxpayer_id
INNER JOIN Income_category c ON i.category_id=c.category_id
INNER JOIN Financial_year f ON i.year_id=f.year_id;

   -- LEVEL-2
SELECT t.full_name,i.income_Source FROM Taxpayer t
INNER JOIN Income_record i ON t.taxpayer_id=i.taxpayer_id
INNER JOIN Income_category c ON i.category_id=c.category_id
WHERE c.category_name='Salary';

SELECT t.full_name,t.occupation,i.income_source FROM Taxpayer t 
INNER JOIN Income_record i ON t.taxpayer_id=i.taxpayer_id
INNER JOIN Income_category c ON i.category_id=c.category_id
WHERE c.category_name='Business';

SELECT t.full_name,f.start_date,f.end_date FROM Taxpayer t 
INNER JOIN Income_record i ON t.taxpayer_id=i.taxpayer_id
INNER JOIN Financial_year f ON i.year_id=f.year_id;

SELECT t.full_name,c.category_name,c.description FROM Taxpayer t
INNER JOIN Income_record i ON t.taxpayer_id=i.taxpayer_id
INNER JOIN Income_category c ON i.category_id=c.category_id;

SELECT t.full_name,t.pan_number,t.occupation,i.income_source,c.category_name,f.year_label,f.start_date,f.end_date FROM Taxpayer t 
INNER JOIN Income_record i ON t.taxpayer_id=i.taxpayer_id
INNER JOIN Income_category c ON i.category_id = c.category_id
INNER JOIN Financial_year f ON i.year_id=f.year_id; 

   -- LEVEL-3
SELECT t.full_name,i.income_source FROM Taxpayer t 
LEFT OUTER JOIN Income_record i ON t.taxpayer_id=i.taxpayer_id;

SELECT c.category_name,i.income_source FROM Income_record i 
RIGHT OUTER JOIN Income_category c ON i.category_id=c.category_id;

SELECT t.full_name,i.income_source FROM Taxpayer t 
LEFT OUTER JOIN Income_record i ON t.taxpayer_id=i.taxpayer_id
UNION
SELECT t.full_name,i.income_source FROM Taxpayer t 
RIGHT OUTER JOIN Income_record i ON t.taxpayer_id=i.taxpayer_id;

SELECT t.full_name,f.year_label FROM Taxpayer t 
CROSS JOIN Financial_year f ;

SELECT A.full_name AS Taxpayer1,B.full_name AS Taxpayer2,
A.occupation FROM Taxpayer A
JOIN Taxpayer B ON A.occupation=B.occupation AND A.taxpayer_id < B.taxpayer_id;

 -- ADDITIONAL
SELECT t.full_name,t.pan_number,i.income_source,c.category_name,f.year_label FROM Taxpayer t 
INNER JOIN Income_record i ON t.taxpayer_id=i.taxpayer_id
INNER JOIN Income_category c ON i.category_id=c.category_id
INNER JOIN Financial_year f ON i.year_id=f.year_id;

SELECT t.full_name,c.category_name,c.description FROM Taxpayer t 
JOIN Income_record i ON t.taxpayer_id=i.taxpayer_id
JOIN Income_category c ON i.category_id=c.category_id;

SELECT i.income_source,f.year_label FROM Income_record i 
JOIN Financial_year f ON i.year_id=f.year_id;

SELECT t.full_name,i.income_source,c.category_name,f.year_label FROM Taxpayer t 
JOIN Income_record i ON t.taxpayer_id=i.taxpayer_id 
JOIN Income_category c ON i.category_id=c.category_id
JOIN Financial_year f ON f.year_id=i.year_id 
WHERE c.category_name='Business' AND f.year_label='2025-2026';

SELECT t.*,i.*,c.*,f.* FROM Taxpayer t 
JOIN Income_record i ON t.taxpayer_id=i.taxpayer_id
JOIN Income_category c ON i.category_id=c.category_id
JOIN Financial_year f ON i.year_id=f.year_id;
