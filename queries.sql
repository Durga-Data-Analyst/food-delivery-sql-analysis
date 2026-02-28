-- Total Orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- Total Revenue
SELECT SUM(order_amount) AS total_revenue
FROM orders;

-- Top 5 Customers by Spending
SELECT 
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(order_amount) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;

-- Peak Order Hour
SELECT 
    EXTRACT(HOUR FROM order_time) AS order_hour,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_hour
ORDER BY total_orders DESC;

-- Revenue by Restaurant
SELECT 
    r.restaurant_name,
    SUM(o.order_amount) AS total_revenue
FROM orders o
JOIN restaurants r 
    ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY total_revenue DESC;

-- Revenue by City
SELECT 
    c.city,
    SUM(o.order_amount) AS total_revenue
FROM orders o
JOIN customers c 
    ON o.customer_id = c.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC;

-- Average Delivery Time by Restaurant
SELECT 
    r.restaurant_name,
    AVG(o.delivery_time) AS avg_delivery_time
FROM orders o
JOIN restaurants r
    ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY avg_delivery_time;
