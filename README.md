# Amazon Vine Analysis - DRAFT-
## Overview
The Amazon Vine program is a service that allows manufacturers and publishers to receive reviews for their products. Companies pay a small fee to Amazon and provide products to Amazon Vine members, who are then required to publish a review. The purpose of this analysis was to determine if there is any bias towards reviews that were written as part of the Vine program. More specifically, if having a paid Vine review made a difference in the percentage of 5-star reviews.  

Amazon reviews of Musical Instruments (U.S.A) was selected for this project. A Google Colab notebook with PySpark was used to extract the dataset, transform the data, connect to an Amazon Web Service (AWS) relational database server (RDS) instance, and load the transformed data into pgAdmin.  Structured query language (SQL) was used to determine if there was any bias toward favorable reviews from Vine members in the dataset. 
The following DataFrames were created, these were transformed into tables in pgAdmin as per the challenge deliverable requirements:
- a. customers_table
- b. products_table
- c. review_id_table
- d, vine_table

Screen shots of the tables are in Appendix I. below.

The following steps were taken to create the tables in pgAdmin:
- a. vine_table was queried to select rows where the total vote count was greater than or equal to 20 to pick reviews that would likely be more helpful and to avoid having   division by zero errors with future queries. The results were saved in vine_table2.
- b. vine_table2 was queried to retrieve all rows where the number of helpful_votes divided by total_votes was greater than or equal to 50%. The results were saved in vine_table3. Steps a. and b. were done to normalize the data.
- c. vine_table3 was queried to :
  - d. Retrieve all rows where a review was written as part of the Vine program (paid). The results were saved in vine_table4.
  - e. Retrieve all rows where a review was not part of the Vine program (unpaid). The results were saved in vine_table5.
  - Retrieve:  
    - f. The total number of reviews
    - g. The total number of 5-star reviews
    - h. The percentage or 5-star reviews for the non-paid and paid reviews relative to the total number of reviews.  
   - g. The percentage of all reviews that were non-paid and paid was also retrieved for comparison to h.

Screen shots of the pgAdmin tables are located in Appendix II. below.

## Results
The findings were as follows:
- a. The total number of Vine non-paid and paid reviews from the normalized data was 14,537.
- b. The total number of 5-star reviews:
  - c. for both non-paid and paid reviews was 8,246.
  - d. that were non-paid was 8,212, which represents 56% of the total reviews listed in bullet point a. 
  - e. that were paid was 34, which represents 0.23% of the total reviews listed in bullet point a. and 56% of the Vine paid reviews in bullet point g.
- f. The total number of all reviews that were non-paid was 14,477, which represents 99.6% of the total reviews listed bullet point a.
- g. The total number of all Vine paid reviews was 60, which represents 0.4% of the total reviews listed in bullet point a.
## Conclusions
The 


## Appendix I.
###### a. customers_table
![create_customers_tbl_1](https://github.com/LleeMcD/Amazon_Vine_Analysis/blob/main/Resources/create_customers_tbl_1.png)
###### b. products_table
![create_products_tbl_drop_dups_2](https://github.com/LleeMcD/Amazon_Vine_Analysis/blob/main/Resources/create_products_tbl_drop_dups_2.png)
###### c. review_id_table
![create_review_id_tbl_df_3](https://github.com/LleeMcD/Amazon_Vine_Analysis/blob/main/Resources/create_review_id_tbl_df_3.png)
###### d. vine_table
![create_vine_tbl_df_4](https://github.com/LleeMcD/Amazon_Vine_Analysis/blob/main/Resources/create_vine_tbl_df_4.png)

## Apendix II.
###### a. vine_table2
![vine_table2](https://github.com/LleeMcD/Amazon_Vine_Analysis/blob/main/Resources/vine_table2.png)
###### b. vine_table3
![vine_table3](https://github.com/LleeMcD/Amazon_Vine_Analysis/blob/main/Resources/vine_table3.png)
###### c. vine_table4
![vine_table4](https://github.com/LleeMcD/Amazon_Vine_Analysis/blob/main/Resources/vine_table4.png)
###### d. vine_table5
![vine_table5](https://github.com/LleeMcD/Amazon_Vine_Analysis/blob/main/Resources/vine_table5.png)
###### e. Total Number of Reviews
![all_reviews_6](https://github.com/LleeMcD/Amazon_Vine_Analysis/blob/main/Resources/all_reviews_6.png)
###### f. Number of 5-Star Reviews
![all_5_star_7](https://github.com/LleeMcD/Amazon_Vine_Analysis/blob/main/Resources/all_5_star_7.png)
###### g. Percentage of 5-Star for Vine Non-Paid and Paid
![percentage_5_y_n_to_whole_8](https://github.com/LleeMcD/Amazon_Vine_Analysis/blob/main/Resources/percentage_5_y_n_to_whole_8.png)
###### h. Percentage of All Non-paid and Paid for Comparison
![percentage_y_n_all_ratings_9](https://github.com/LleeMcD/Amazon_Vine_Analysis/blob/main/Resources/percentage_y_n_all_ratings_9.png)
