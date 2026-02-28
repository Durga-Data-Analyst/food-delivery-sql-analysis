SELECT * FROM food_delivery LIMIT 10;


-- Top 10 highest rated restaurants
SELECT restaurant,AVG(avg_ratings) AS avg_ratings FROM food_delivery
GROUP BY restaurant
ORDER BY avg_ratings DESC
LIMIT 10 ;

-- Restaurants with slowest delivery
SELECT restaurant,AVG(delivery_time) AS Avg_delivery_time
FROM food_delivery
GROUP BY restaurant
ORDER BY Avg_delivery_time;

--Which city has highest average price?
SELECT city,AVG(price) AS average_price 
FROM food_delivery
GROUP BY city
ORDER BY average_price DESC ;

--Which areas have most restaurants?
SELECT area,COUNT(*) AS restaurant
FROM food_delivery
GROUP BY area
ORDER BY restaurant DESC ;

--Best rated city?
SELECT city,(avg_ratings) AS average_ratings
FROM food_delivery
GROUP BY city
ORDER BY average_ratings
LIMIT 1;

--Which city has highest  Average delivery time?
SELECT city,AVG(delivery_time)as averge_delivery_time
FROM food_delivery
GROUP BY city
ORDER BY averge_delivery_time DESC
LIMIT 1;

--Which restaurant causes delays?
SELECT city,restaurant,AVG(delivery_time) AS averge_delivery_time
FROM food_delivery
GROUP BY city,restaurant
ORDER BY averge_delivery_time 
LIMIT 1;

--Most common food types?
SELECT food_type,COUNT(*)as Restaurant_count
FROM food_delivery
GROUP BY food_type
ORDER BY Restaurant_count DESC 
LIMIT 1;


--Does high delivery time reduce ratings?
SELECT 
     CASE
	 WHEN delivery_time<=40 THEN 'fast'
	 WHEN delivery_time BETWEEN 41 AND 60 THEN 'Medium'
	 ELSE 'slow'
	 END AS Delivery_category,
AVG(avg_ratings) as avg_ratings
FROM food_delivery
GROUP BY Delivery_category;

--Identify premium partners.
SELECT restaurant,
       AVG(price) AS avg_price,
       AVG(avg_ratings) AS rating
FROM food_delivery
GROUP BY restaurant
HAVING AVG(price) > 500 AND AVG(avg_ratings) >= 4;

--Data Cleaning & Quality Audit	 
SELECT * FROM food_delivery
WHERE price IS NULL OR avg_ratings IS NULL ;
  
