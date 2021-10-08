# Amazon Vine Analysis
## Overview
The Amazon Vine program is a service that allows manufacturers and publishers to receive reviews for their products. Companies pay a small fee to Amazon and provide products to Amazon Vine members, who are then required to publish a review. The purpose of this analysis was to determine if there is any bias towards reviews that were written as part of the Vine program. More specifically, if having a paid Vine review made a difference in the percentage of 5-star reviews.  
Amazon reviews of Musical Instruments (U.S.A) was selected for this project. A Google Colab notebook with PySpark was used to extract the dataset, transform the data, connect to an Amazon Web Service (AWS) relational database server (RDS) instance, and load the transformed data into pgAdmin.  Structured query language (SQL) was used to determine if there was any bias toward favorable reviews from Vine members in the dataset. 
The following DataFrames were created, these were transformed into tables in pgAdmin:
- customers_table
![]()
- products_table
![]()
- review_id_table
![]()
- vine_table
![]()

The following steps were taken to create the tables in pgAdmin:
-  Table vine_table was queried to select  rows where the total vote count was greater than or equal to 20 to pick reviews that would likely be more helpful and to avoid having division by zero errors with future queries. The results were saved in vine_table2.
- Table vine_table2 was queried to retrieve all rows where the number of helpful_votes divided by total_votes was greater than or equal to 50%. The results were saved in vine_table3
- Table vine_table3 was queried to retrieve all rows where a review was written as part of the Vine program (paid). The results were saved in vine_table4.
- Table vine_table3 was then queried to retrieve all rows where a review was not part of the Vine program (unpaid). The results were saved in vine_table5.
- Table vine_table3 was then  queried to retrieve the total number of reviews, the number of 5-star reviews an the percentage or 5-star reviews for the two types of review (paid versus unpaid).
## Findings

