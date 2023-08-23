-- Profiling and Analyzing the Yelp Dataset




-- Yelp Dataset Profiling and Understanding

-- Let's Profile the data by finding the total number of records for each of the tables below:
/* 	
i. Attribute table = 10,000
ii. Business table =10,000
iii. Category table = 10,000
iv. Checkin table = 10,000
v. elite_years table = 10,000
vi. friend table = 10,000
vii. hours table = 10,000
viii. photo table = 10,000
ix. review table = 10,000
x. tip table = 10,000
xi. user table = 10,000
*/ 	


-- Now let's Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.
/*
i. Business = 10,000 (Primary Key)
ii. Hours = 1562 (Business_id Foreign Key)
iii. Category = 2643 (Business_id Foreign Key)
iv. Attribute = 1115 (Business_id Foreign Key)
v. Review = 8090 (Business_id Foreign Key)
vi. Checkin = 493 (Business_id Foreign Key)
vii. Photo = 6493 (Business_id Foreign Key)
viii. Tip = 3979 (Business_id Foreign Key)
ix. User = 10,000 (Primary Key)
x. Friend = 11 (User_ID Foreign Key)
xi. Elite_years = 2780 (User_ID Foreign Key)
*/ 
	



-- An important question .. Are there any columns with null values in the Users table?

-- According to the query below, there are no columns with null values , Knowing that the total records are 10000, we counted the records for each column to make sure if it's matching.---
	

SELECT COUNT(Name), Count(review_count),Count(yelping_since),Count(useful),
       Count(funny),Count(cool),Count(fans),Count(Average_stars),Count(Compliment_hot),Count(Compliment_more)
      ,Count(Compliment_profile),Count(Compliment_cute),Count(Compliment_list),Count(Compliment_Note)
      ,Count(Compliment_plain),Count(Compliment_cool),Count(Compliment_funny),Count(Compliment_Writer),
       Count(Compliment_photos)
FROM User
	
		


--Let's List the cities with the most reviews in descending order:

	

SELECT    sum(review_count) AS total_reviews, city
FROM      business
GROUP BY  city
ORDER BY  total_reviews DESC
	
the Result Below:
/*
+------------+--------------+
| city       | review_count |
+------------+--------------+
| Las Vegas  |         3873 |
| Montréal   |         1757 |
| Gilbert    |         1549 |
| Las Vegas  |         1410 |
| Las Vegas  |         1389 |
| Las Vegas  |         1252 |
| Las Vegas  |         1116 |
| Las Vegas  |         1084 |
| Las Vegas  |          961 |
| Gilbert    |          902 |
| Las Vegas  |          864 |
| Scottsdale |          823 |
| Las Vegas  |          821 |
| Las Vegas  |          786 |
| Henderson  |          785 |
| Toronto    |          778 |
| Las Vegas  |          768 |
| Las Vegas  |          758 |
| Scottsdale |          726 |
| Cleveland  |          723 |
| Las Vegas  |          720 |
| Charlotte  |          715 |
| Phoenix    |          711 |
| Las Vegas  |          706 |
| Phoenix    |          700 |
+------------+--------------+
*/
	
-- Now, let's find the distribution of star ratings to the business for some cities:

-- For Avon


SELECT   Stars AS Star_Rating, COUNT(Stars) AS Count 
FROM     Business 
WHERE    City = 'Avon'
Group By Stars

-- The Results
/*
+-------------+-------+
| Star_Rating | Count |
+-------------+-------+
|         1.5 |     1 |
|         2.5 |     2 |
|         3.5 |     3 |
|         4.0 |     2 |
|         4.5 |     1 |
|         5.0 |     1 |
+-------------+-------+
*/

--For Beachwood


SELECT   Stars AS Star_Rating, COUNT(Stars) AS Count 
FROM     Business 
WHERE    City = 'Beachwood'
Group By Stars

-- The Results
/*	
+-------------+-------+
| Star_Rating | Count |
+-------------+-------+
|         2.0 |     1 |
|         2.5 |     1 |
|         3.0 |     2 |
|         3.5 |     2 |
|         4.0 |     1 |
|         4.5 |     2 |
|         5.0 |     5 |
+-------------+-------+
*/

-- It's important to find the top 3 users based on their total number of reviews:
		

	
SELECT   ID, Name, Review_Count
FROM     User
ORDER BY Review_Count DESC
LIMIT 3
		
-- the Results
/*		
+------------------------+--------+--------------+
| id                     | name   | review_count |
+------------------------+--------+--------------+
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |         2000 |
| -3s52C4zL_DHRK0ULG6qtg | Sara   |         1629 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri   |         1339 |
+------------------------+--------+--------------+
*/

-- Does posing more reviews correlate with more fans?

/*
If we used SQL to show the number of review and fans for each user, we will find that there is no relation between number of reviews and number of fans. After ordering the number of reviews in descending order, we can see that some users with less reviews are having more fans. 
*/
	
--Let's find out if there are more reviews with the word "love" or with the word "hate" in them?

--	There are more reviews with the word 'Love' than the word 'Hate'

-- The results :

SELECT COUNT(Text) AS love_reviews
FROM   Review
WHERE  text LIKE '%Love%'
/*
+--------------+
| love_reviews |
+--------------+
|         1780 |
+--------------+
*/

SELECT COUNT(Text) AS Hate_reviews
FROM   Review
WHERE  text LIKE '%Hate%'

/*
+--------------+
| Hate_reviews |
+--------------+
|          232 |
+--------------+
*/	




-- OK, LET'S Find the top 10 users with the most fans:


	 SELECT   Name, Fans
         FROM     User
         Order By FANS DESC
         LIMIT    10
	
-- the Results: 
/*
+-----------+------+
| name      | fans |
+-----------+------+
| Amy       |  503 |
| Mimi      |  497 |
| Harald    |  311 |
| Gerald    |  253 |
| Christine |  173 |
| Lisa      |  159 |
| Cat       |  133 |
| William   |  126 |
| Fran      |  124 |
| Lissa     |  120 |
+-----------+------+
*/	
		




-- LET'S GO TO THE INFERENCES AND ANALYSIS PART



/* Let's Pick one city and category of our choice and group the businesses in that city or category by their overall star rating. In addition, Let's Compare the businesses with 2-3 stars to the businesses with 4-5 stars. Let's ask some awsome questions :
	
Do the two groups you chose to analyze have a different distribution of hours? 

Selecting the City (Toronto) and the category (Food), We found out that there are three food businesses in that city (Cabin Fever, Loblaws, and Halo Brewery), Two of them with 4-5 stars. Obviously, the business that starts at the morning is having less stars, while the businesses that starts after 3 pm are havinf better stars rating. 

Do the two groups you chose to analyze have a different number of reviews?

yes, they are having different number of reviews.

Are we able to infer anything from the location data provided between these two groups?

We can notice that the time and working hours is affecting the rating of the food businesses. However, to get more accurate results, we should get enough number of reviews. In addition, all the businesses should get close number of reviews. */

-- SQL code used for analysis:

SELECT      B.City,B.Name, H.business_id, H.hours, C.Category,B.Review_count, B.stars
FROM        Business B 
INNER JOIN  Hours H ON B.id = H.Business_id 
INNER JOIN  Category C ON H.business_id = C.Business_id
WHERE       City ='Toronto' AND Category ='Food'



/* Now, Let's group business based on the ones that are open and the ones that are closed. 
What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at our answer.

Difference 1:

When we group businesses based on the states they are located at, we can find out that there are 7 states having only open businesses, those 7 states are ( C, ESX, FIF, NY, NYK, ST, WLN ). While the rest are having both opened and closed businesses with different percentages.      

Difference 2:

When we select Restaurants category as an example, we will find out that number of reviews are much less for closed businesses. According to my analysis, the number of reviews for Open Restaurants businesses are 3772 while the number of reviews for the closed restaurant businesses are only 732. */

-- SQL code used for analysis:

- - To group Opened and closed businesses based on state 
SELECT    state, COUNT(Is_open)
FROM      Business
WHERE     Is_open = 0
group by  state

SELECT    state, COUNT(Is_open)
FROM      Business
WHERE     Is_open = 1
group by  state

-- To Compare number of reviews 
-- For Open Businesses 

SELECT    C.Category, SUM(review_count) AS Num_REV
FROM      Business B INNER JOIN Category C ON B.id = C.business_id
WHERE     B.Is_open = 1 AND Category = 'Restaurants'
GROUP BY  Category

-- For closed businesses 

SELECT    C.Category, SUM(review_count) AS Num_REV
FROM      Business B INNER JOIN Category C ON B.id = C.business_id
WHERE     B.Is_open = 0 AND Category = 'Restaurants'
GROUP BY  Category


	

-- What is also important is Finding the best Category of businesses that are open and have high stars rating. 
         
/*
In order to find the best category of businesses that are still open and have high rating considering the number of reviews (To be minimum 350 Reviews), we need the data that tells us the category of each business, the rating for each business and the number of reviews of each business. in this analysis we will try to find the most successful category of businesses.     */                       
                  

SELECT   B.Name, B.Stars, B.review_count, B.Is_open, C.category
FROM     Business B INNER JOIN Category C ON B.id = C.business_id
WHERE    B.review_count > 350
ORDER BY B.Stars DESC         
         
/* 
According to the results of the query, we found out that most of the open businesses that have high stars rating are having common words like (Food, sandwiches, restaurants, Meat, fruits and Veggies). Almost all of them are related to food businesses. In conclusion, Businesses with categories related to food are most likely to success. */
