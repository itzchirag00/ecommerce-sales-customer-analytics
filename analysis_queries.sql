-- Monthly revenue
SELECT strftime('%Y-%m', order_date) AS month,
       ROUND(SUM(revenue),2) AS revenue
FROM orders GROUP BY month ORDER BY month;

-- Revenue by category
SELECT category, ROUND(SUM(revenue),2) AS revenue
FROM orders GROUP BY category ORDER BY revenue DESC;

-- Top products
SELECT product_name, SUM(quantity) AS units_sold,
       ROUND(SUM(revenue),2) AS revenue
FROM orders GROUP BY product_name ORDER BY revenue DESC LIMIT 5;

-- Regional performance
SELECT region, COUNT(DISTINCT customer_id) AS customers,
       ROUND(SUM(revenue),2) AS revenue
FROM orders GROUP BY region ORDER BY revenue DESC;

-- Repeat customers
SELECT customer_id, COUNT(DISTINCT order_id) AS order_count,
       ROUND(SUM(revenue),2) AS lifetime_revenue
FROM orders GROUP BY customer_id
HAVING COUNT(DISTINCT order_id) > 1
ORDER BY lifetime_revenue DESC;

-- Average order value
SELECT ROUND(SUM(revenue)/COUNT(DISTINCT order_id),2) AS average_order_value
FROM orders;

-- Category revenue share
SELECT category,
       ROUND(100.0*SUM(revenue)/(SELECT SUM(revenue) FROM orders),2) AS revenue_share_pct
FROM orders GROUP BY category ORDER BY revenue_share_pct DESC;

-- Product ranking within category
WITH product_sales AS (
    SELECT category, product_name, SUM(revenue) AS revenue
    FROM orders GROUP BY category, product_name
)
SELECT category, product_name, ROUND(revenue,2) AS revenue,
       RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS category_rank
FROM product_sales ORDER BY category, category_rank;
