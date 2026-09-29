SELECT COUNT(*) AS total_rows FROM sales;
/* Data Cleaning */
-- Check how many rows are missing values in Product_Category_2 and Product_Category_3
SELECT
    SUM(CASE WHEN Product_Category_2 IS NULL OR Product_Category_2 = '' THEN 1 ELSE 0 END) AS null_cat2,
    SUM(CASE WHEN Product_Category_3 IS NULL OR Product_Category_3 = '' THEN 1 ELSE 0 END) AS null_cat3,
     SUM(CASE WHEN Product_Category_1 IS NULL OR Product_Category_1 = '' THEN 1 ELSE 0 END) AS null_cat1
FROM sales;

/* Check for fully duplicated transactions (same User_ID, Product_ID, and Purchase amount)*/
SELECT User_ID, Product_ID, Purchase, COUNT(*) AS cnt
FROM sales
GROUP BY User_ID, Product_ID, Purchase
HAVING COUNT(*) > 1;

/* filling the NULL value IN Product_category2,Product_Category_2 as 0*/
SET SQL_SAFE_UPDATES = 0;
UPDATE sales SET Product_Category_2 = '0' WHERE Product_Category_2 = '' OR Product_Category_2 IS NULL;
UPDATE sales SET Product_Category_3 = '0' WHERE Product_Category_3 = '' OR Product_Category_3 IS NULL;
/* change Product_category Data Type INTO INT */
ALTER TABLE sales MODIFY Product_Category_1 INT;
ALTER TABLE sales MODIFY Product_Category_2 INT;
ALTER TABLE sales MODIFY Product_Category_3 INT;

DESCRIBE sales;

SELECT
    SUM(CASE WHEN Product_Category_2 IS NULL THEN 1 ELSE 0 END) AS null_cat2,
    SUM(CASE WHEN Product_Category_3 IS NULL THEN 1 ELSE 0 END) AS null_cat3
FROM sales;

/* Data Cleaning  Summary 
#550,068 rows loaded
#0 duplicate transactions
#173,638 blanks in Category_2 filled with 0
#383,247 blanks in Category_3 filled with 0
#All columns converted back to correct types (INT)
*/
-- Demographics & Spending--- 
-- 1. Write a SQL query to find the average and total purchase amount by gender
SELECT
    Gender,
    ROUND(AVG(Purchase), 2) AS avg_purchase,
    SUM(Purchase) AS total_purchase,
    COUNT(*) AS transaction_count
FROM sales
GROUP BY Gender;
/*  OUtput 
Men spend more overall*/

-- 2. Write a SQL query to find the total and average purchase amount for each age group.
SELECT
    Age,
    ROUND(AVG(Purchase), 2) AS avg_purchase,
    SUM(Purchase) AS total_purchase,
    COUNT(*) AS transaction_count
FROM sales
GROUP BY Age
ORDER BY FIELD(Age, '0-17','18-25','26-35','36-45','46-50','51-55','55+');

-- 3. Write a SQL query to compare average purchase amount between married and unmarried customers.
SELECT
    Marital_Status,
    ROUND(AVG(Purchase), 2) AS avg_purchase,
    SUM(Purchase) AS total_purchase,
    COUNT(*) AS transaction_count
FROM sales
GROUP BY Marital_Status;

-- 4. Write a SQL query to find which occupation category generates the highest total and average purchase
SELECT
    Occupation,
    ROUND(AVG(Purchase), 2) AS avg_purchase,
    SUM(Purchase) AS total_purchase,
    COUNT(*) AS transaction_count
FROM sales
GROUP BY Occupation
ORDER BY total_purchase DESC;

-- LOcation ----
-- 5. Write a SQL query to find which city category generates the highest total revenue.
SELECT
    City_Category,
    ROUND(AVG(Purchase), 2) AS avg_purchase,
    SUM(Purchase) AS total_purchase,
    COUNT(*) AS transaction_count
FROM sales
GROUP BY City_Category
ORDER BY total_purchase DESC;
-- 6. Write a SQL query to check if years lived in current city affects average purchase amount.
SELECT
    Stay_In_Current_City_Years,
    ROUND(AVG(Purchase), 2) AS avg_purchase,
    SUM(Purchase) AS total_purchase,
    COUNT(*) AS transaction_count
FROM sales
GROUP BY Stay_In_Current_City_Years
ORDER BY FIELD(Stay_In_Current_City_Years, '0','1','2','3','4+');

-- 7.Find the most frequently purchased product categories?
SELECT
    Product_Category_1,
    COUNT(*) AS transaction_count
FROM sales
GROUP BY Product_Category_1
ORDER BY transaction_count DESC
LIMIT 10;

-- 8.Find which product categories generate the highest total revenue?
SELECT
    Product_Category_1,
    SUM(Purchase) AS total_revenue
FROM sales
GROUP BY Product_Category_1
ORDER BY total_revenue DESC
LIMIT 10;
-- Q9: Find the min, max, average, and standard deviation of purchase amounts?
SELECT
    MIN(Purchase) AS min_purchase,
    MAX(Purchase) AS max_purchase,
    ROUND(AVG(Purchase), 2) AS mean_purchase,
    ROUND(STDDEV(Purchase), 2) AS std_purchase
FROM sales;

-- Q10: Find the top 10 customers by total purchase amount?
SELECT
    User_ID,
    SUM(Purchase) AS total_spend
FROM sales
GROUP BY User_ID
ORDER BY total_spend DESC
LIMIT 10;
-- Q11: Find which age and gender combination contributes the highest percentage of total revenue?
SELECT
    Age,
    Gender,
    SUM(Purchase) AS total_revenue,
    ROUND(SUM(Purchase) * 100.0 / (SELECT SUM(Purchase) FROM sales), 2) AS pct_of_total_revenue
FROM sales
GROUP BY Age, Gender
ORDER BY total_revenue DESC;

-- Q12: Find the average purchase amount for each occupation within each city category?
SELECT
    Occupation,
    City_Category,
    ROUND(AVG(Purchase), 2) AS avg_purchase
FROM sales
GROUP BY Occupation, City_Category
ORDER BY Occupation, City_Category;

-- Q13: Find the correlation between purchase amount and other numeric fields (Occupation, Marital Status, Product Category codes).
SELECT
    (COUNT(*) * SUM(Occupation * Purchase) - SUM(Occupation) * SUM(Purchase))
    /
    (SQRT(COUNT(*) * SUM(Occupation * Occupation) - SUM(Occupation) * SUM(Occupation))
     * SQRT(COUNT(*) * SUM(Purchase * Purchase) - SUM(Purchase) * SUM(Purchase)))
    AS correlation_occupation_purchase
FROM sales;