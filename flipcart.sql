CREATE DATABASE flipkarts;
USE flipkarts;
-- upload flipkart_mobiles.csv into table and name it as mobiles
SELECT * FROM mobiles;

-- different price range segments for mobiles in India
SELECT
 Brand,
  SUM(CASE WHEN MRP BETWEEN 0 AND 9999 THEN 1 ELSE 0 END) AS 'Price Below 10k',
  SUM(CASE WHEN MRP BETWEEN 10000 AND 19999 THEN 1 ELSE 0 END) AS 'Price between 10-20k',
  SUM(CASE WHEN MRP BETWEEN 20000 AND 39999 THEN 1 ELSE 0 END) AS 'Price between 20-40k',
  SUM(CASE WHEN MRP>=40000 THEN 1 ELSE 0 END) AS 'Price Above 40k'
FROM 
  mobiles
GROUP BY 
  Brand 
ORDER BY
 Brand;
 
-- the brand  that has the highest discounted price
SELECT 
   Brand,
   MAX(MRP-MSP) AS MaxDiscount
FROM 
   mobiles
GROUP BY
   Brand
ORDER BY 
   MaxDiscount DESC
LIMIT 1;

-- top 5 brands avg ratings
SELECT Brand, AVG(Ratings) AS Avg_Rating
FROM Mobiles
GROUP BY Brand
ORDER BY Avg_Rating DESC
LIMIT 5;

-- top 5 Brands by total number of reviews
SELECT Brand, SUM(No_of_reviews) AS Total_Reviews
FROM mobiles
GROUP BY Brand
ORDER BY Total_Reviews DESC
LIMIT 5;

-- products wuth ratings greater than 4.5
SELECT * FROM mobiles
WHERE Ratings>4.5;

--  products with discount gretaer than 40%
SELECT * FROM mobiles
WHERE Discount>40;

-- Average rating and number of reviews per brand
SELECT Brand,AVG(Ratings) AS Avg_Rating,SUM(NO_of_reviews) AS Total_Reviews
FROM mobiles
GROUP BY Brand
ORDER BY Avg_Rating DESC;

-- products with the highest discounts
SELECT * FROM mobiles
ORDER BY Discount DESC
LIMIT 5;

-- Get Unique Brands Names
SELECT DISTINCT Brand
FROM Mobiles;