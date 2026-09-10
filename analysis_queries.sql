USE ecommerce_analytics;

-- ============================================
-- 1. Overall Business KPIs
-- ============================================

SELECT
    SUM(revenue) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(quantity) AS total_units_sold,
    ROUND(SUM(revenue) / COUNT(DISTINCT order_id), 2) AS average_order_value
FROM orders;


-- ============================================
-- 2. Category Performance
-- ============================================

SELECT
    category,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS units_sold,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(
        100 * SUM(revenue) /
        (SELECT SUM(revenue) FROM orders),
        2
    ) AS revenue_share_pct
FROM orders
GROUP BY category
ORDER BY total_revenue DESC;


-- ============================================
-- 3. Regional Performance
-- ============================================

SELECT
    region,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS units_sold,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(
        100 * SUM(revenue) /
        (SELECT SUM(revenue) FROM orders),
        2
    ) AS revenue_share_pct
FROM orders
GROUP BY region
ORDER BY total_revenue DESC;


-- ============================================
-- 4. Top Products
-- ============================================

SELECT
    product_name,
    category,
    SUM(quantity) AS units_sold,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM orders
GROUP BY product_name, category
ORDER BY total_revenue DESC
LIMIT 10;


-- ============================================
-- 5. Top Customers
-- ============================================

SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS units_bought,
    ROUND(SUM(revenue), 2) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;


-- ============================================
-- 6. Repeat vs One-Time Customers
-- ============================================

WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS order_count,
        SUM(revenue) AS total_spent
    FROM orders
    GROUP BY customer_id
)
SELECT
    CASE
        WHEN order_count = 1 THEN 'One-time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS customers,
    ROUND(AVG(total_spent), 2) AS avg_spend
FROM customer_orders
GROUP BY customer_type;


-- ============================================
-- 7. Customer Ranking using RANK()
-- ============================================

WITH customer_spend AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS total_orders,
        SUM(revenue) AS total_spent
    FROM orders
    GROUP BY customer_id
)
SELECT
    customer_id,
    total_orders,
    ROUND(total_spent, 2) AS total_spent,
    RANK() OVER (ORDER BY total_spent DESC) AS customer_rank
FROM customer_spend
ORDER BY customer_rank
LIMIT 10;


-- ============================================
-- 8. Customer Revenue Contribution
-- ============================================

WITH customer_spend AS (
    SELECT
        customer_id,
        SUM(revenue) AS total_spent
    FROM orders
    GROUP BY customer_id
)
SELECT
    customer_id,
    ROUND(total_spent, 2) AS total_spent,
    ROUND(
        100 * total_spent /
        SUM(total_spent) OVER (),
        2
    ) AS revenue_contribution_pct
FROM customer_spend
ORDER BY total_spent DESC
LIMIT 10;


-- ============================================
-- 9. Monthly Sales Trend
-- ============================================

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS units_sold,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;


-- ============================================
-- 10. Best Product by Category
-- Using ROW_NUMBER()
-- ============================================

WITH product_sales AS (
    SELECT
        category,
        product_name,
        SUM(quantity) AS units_sold,
        ROUND(SUM(revenue), 2) AS total_revenue
    FROM orders
    GROUP BY category, product_name
),
ranked_products AS (
    SELECT
        category,
        product_name,
        units_sold,
        total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY total_revenue DESC
        ) AS category_rank
    FROM product_sales
)
SELECT
    category,
    product_name,
    units_sold,
    total_revenue,
    category_rank
FROM ranked_products
WHERE category_rank = 1
ORDER BY total_revenue DESC;


-- ============================================
-- 11. Month-over-Month Revenue Growth
-- Using LAG()
-- ============================================

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(revenue) AS total_revenue
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT
    month,
    ROUND(total_revenue, 2) AS total_revenue,
    ROUND(
        LAG(total_revenue) OVER (ORDER BY month),
        2
    ) AS previous_month_revenue,
    ROUND(
        100 * (
            total_revenue -
            LAG(total_revenue) OVER (ORDER BY month)
        ) /
        LAG(total_revenue) OVER (ORDER BY month),
        2
    ) AS mom_growth_pct
FROM monthly_sales
ORDER BY month;


-- ============================================
-- 12. Customer Segmentation
-- ============================================

WITH customer_spend AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS total_orders,
        ROUND(SUM(revenue), 2) AS total_spent
    FROM orders
    GROUP BY customer_id
)
SELECT
    customer_id,
    total_orders,
    total_spent,
    CASE
        WHEN total_spent >= 15000 THEN 'High Value'
        WHEN total_spent >= 7500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customer_spend
ORDER BY total_spent DESC;


-- ============================================
-- 13. Final Customer Ranking + Contribution
-- ============================================

WITH customer_spend AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS total_orders,
        SUM(revenue) AS total_spent
    FROM orders
    GROUP BY customer_id
)
SELECT
    customer_id,
    total_orders,
    ROUND(total_spent, 2) AS total_spent,
    RANK() OVER (
        ORDER BY total_spent DESC
    ) AS customer_rank,
    ROUND(
        100 * total_spent /
        SUM(total_spent) OVER (),
        2
    ) AS revenue_contribution_pct
FROM customer_spend
ORDER BY customer_rank
LIMIT 10;
