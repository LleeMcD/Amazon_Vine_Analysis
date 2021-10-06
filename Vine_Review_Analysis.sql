-- Vine table created from AWS and pgAdmin
SELECT *
FROM vine_table

-- Challenge deliverable 2 step 1 total vote >= 20
SELECT * 
INTO vine_table2
FROM vine_table
WHERE total_votes >= 20;

-- Challenge deliverable 2 step 2 helpful_votes / total_votes >= 50%
SELECT *
INTO vine_table3
FROM vine_table2
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5

-- Challenge deliverable 2 step 3 Vine program paid, vine = 'Y'
SELECT *
INTO vine_table4
FROM vine_table3
WHERE vine = 'Y';

-- Challenge deliverable 2 step 4 Vine program paid, vine = 'N'
SELECT *
INTO vine_table5
FROM vine_table3
WHERE vine = 'N';

-- Challenge deliverable 2 step 5 
-- a. Create table of total number of reviews (null values removed).
SELECT DISTINCT COUNT (review_id) AS "Total Reviews",
star_rating AS "Star Rating", 
vine AS "Vine Paid (Y, N)"
INTO summary_all_reviews_table
FROM vine_table
WHERE vine IS NOT NULL
GROUP BY "Star Rating", "Vine Paid (Y, N)";

-- a. Total number of reviews 
SELECT SUM("Total Reviews") as "Sum Total Reviews - All"
FROM summary_all_reviews_table;

-- b. Number of 5-star reviews overall.
SELECT SUM("Total Reviews") AS "Total Reviews",
"Star Rating" 
FROM summary_all_reviews_table
WHERE "Star Rating" = 5
GROUP BY "Star Rating";

-- c. Percentage of 5 star reviews for Vine paid and unpaid reviews as compared to total reviews.
SELECT
	"Vine Paid (Y, N)" 
	,SUM ("Total Reviews") AS "Total 5-Star Reviews"
	,SUM ("Total Reviews" /(
		                     SELECT
								ROUND(SUM("Total Reviews"),0)  
							 FROM summary_all_reviews_table)
		  					 ) AS "Total Percentage of 5-Star Reviews Vine Paid(Y,N)"
FROM summary_all_reviews_table
WHERE "Star Rating" = 5
GROUP BY "Vine Paid (Y, N)";

-- Percentage of Vine paid and unpaid reviews overall for comparison
SELECT
	"Vine Paid (Y, N)" 
	,SUM ("Total Reviews") AS "Total Reviews"
	,SUM ("Total Reviews" /(
		                     SELECT
								SUM("Total Reviews") 
							 FROM summary_all_reviews_table)
		  					 ) AS "Total % Vine Paid(Y,N) All Reviews"
FROM summary_all_reviews_table
GROUP BY "Vine Paid (Y, N)";





