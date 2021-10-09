CREATE TABLE review_id_table (
  review_id TEXT PRIMARY KEY NOT NULL,
  customer_id INTEGER,
  product_id TEXT,
  product_parent INTEGER,
  review_date DATE -- this should be in the formate yyyy-mm-dd
);

-- This table will contain only unique values
CREATE TABLE products_table (
  product_id TEXT PRIMARY KEY NOT NULL UNIQUE,
  product_title TEXT
);

-- Customer table for first data set
CREATE TABLE customers_table (
  customer_id INT PRIMARY KEY NOT NULL UNIQUE,
  customer_count INT
);

-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

-- Challenge deliverable 2 step 1 total vote >= 20
SELECT * 
INTO vine_table2
FROM vine_table
WHERE total_votes >= 20;

-- Challenge deliverable 2 step 2 where total vote >= 20 and 
-- helpful_votes / total_votes >= 50%
SELECT *
INTO vine_table3
FROM vine_table2
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5

-- Challenge deliverable 2 step 3 Vine program paid, vine = 'Y' where 
-- total vote >= 20 and helpful_votes / total_votes >= 50%
SELECT *
INTO vine_table4
FROM vine_table3
WHERE vine = 'Y';

SELECT *
FROM vine_table4
WHERE star_rating = 5;

-- Challenge deliverable 2 step 4 Vine program paid, vine = 'N' where 
-- total vote >= 20 and helpful_votes / total_votes >= 50%
SELECT *
INTO vine_table5
FROM vine_table3
WHERE vine = 'N';
	
	
-- Challenge deliverable 2 step 5 
-- Create table of total number of reviews (null values removed).
SELECT DISTINCT COUNT (review_id) AS "Total Reviews",
star_rating AS "Star Rating", 
vine AS "Vine Paid (Y, N)"
INTO summary_by_percent_votes_table
FROM vine_table3
WHERE vine IS NOT NULL
GROUP BY "Star Rating", "Vine Paid (Y, N)";

-- a. Get the total number of reviews where total vote >= 20 and 
-- helpful_votes / total_votes >= 50%
SELECT SUM("Total Reviews") as "Sum Total Reviews - All"
FROM summary_by_percent_votes_table;

-- b. Number of 5-star reviews where total vote >= 20 and 
-- helpful_votes / total_votes >= 50%
SELECT SUM("Total Reviews") AS "Total Reviews",
"Star Rating" 
FROM summary_by_percent_votes_table
WHERE "Star Rating" = 5
GROUP BY "Star Rating";

-- c. Percentage of 5 star reviews for Vine paid and unpaid as compared 
-- to total number of reviews where helpful_votes / total_votes >= 50% 
SELECT
	"Vine Paid (Y, N)" 
	,SUM ("Total Reviews") AS "Total 5-Star Reviews"
	,SUM ("Total Reviews" /(
		                     SELECT
								ROUND(SUM("Total Reviews"))  
							 FROM summary_by_percent_votes_table)
		  					 ) AS "Total Percentage of 5-Star Reviews Vine Paid(Y,N)"
FROM summary_by_percent_votes_table
WHERE "Star Rating" = 5
GROUP BY "Vine Paid (Y, N)";

--d. Percentage of Vine paid and unpaid reviews where total vote >= 20 and 
-- helpful_votes / total_votes >= 50% for comparison with c.
SELECT
	"Vine Paid (Y, N)" 
	,SUM ("Total Reviews") AS "Total Reviews"
	,SUM ("Total Reviews" /(
		                     SELECT
								ROUND(SUM("Total Reviews"))
							 FROM summary_by_percent_votes_table)
		  					 ) AS "Total % Vine Paid(Y,N) All Reviews"
FROM summary_by_percent_votes_table
GROUP BY "Vine Paid (Y, N)";

