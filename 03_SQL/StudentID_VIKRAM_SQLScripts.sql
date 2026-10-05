-- ============================================================
-- Olist E-Commerce Project
-- SQL Analytical Queries
-- File: StudentID_VIKRAM_SQLScripts.sql
-- Database: OlistECommerceDB
-- ============================================================

USE OlistECommerceDB;


-- ============================================================
-- 1. ORDER COUNT BY STATUS
-- Concept: Aggregation, GROUP BY, ORDER BY
-- ============================================================

SELECT 
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;


-- ============================================================
-- 2. REVENUE BY CUSTOMER STATE
-- Concept: JOIN, Aggregation, GROUP BY
-- ============================================================

SELECT
    c.customer_state,
    SUM(oi.price) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC;


-- ============================================================
-- 3. TOP 10 PRODUCT CATEGORIES BY REVENUE
-- Concept: JOIN, Aggregation, GROUP BY, LIMIT
-- ============================================================

SELECT
    p.product_category_name,
    SUM(oi.price) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;


-- ============================================================
-- 4. TOP 10 SELLERS BY REVENUE
-- Concept: JOIN, Aggregation, GROUP BY, LIMIT
-- ============================================================

SELECT
    s.seller_id,
    s.seller_state,
    SUM(oi.price) AS total_revenue
FROM sellers s
JOIN order_items oi
    ON s.seller_id = oi.seller_id
GROUP BY s.seller_id, s.seller_state
ORDER BY total_revenue DESC
LIMIT 10;


-- ============================================================
-- 5. REVENUE BY SELLER STATE
-- Concept: JOIN, Aggregation, GROUP BY
-- ============================================================

SELECT
    s.seller_state,
    SUM(oi.price) AS total_revenue
FROM sellers s
JOIN order_items oi
    ON s.seller_id = oi.seller_id
GROUP BY s.seller_state
ORDER BY total_revenue DESC;


-- ============================================================
-- 6. CUSTOMERS BY STATE
-- Concept: Aggregation, GROUP BY, DISTINCT
-- ============================================================

SELECT
    customer_state,
    COUNT(DISTINCT customer_unique_id) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;


-- ============================================================
-- 7. TOP 10 CUSTOMERS BY TOTAL SPENDING
-- Concept: Multiple JOINs, Aggregation, GROUP BY, LIMIT
-- ============================================================

SELECT
    c.customer_unique_id,
    SUM(oi.price) AS total_spending
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_unique_id
ORDER BY total_spending DESC
LIMIT 10;


-- ============================================================
-- 8. REPEAT CUSTOMERS
-- Concept: JOIN, GROUP BY, HAVING (Filtering)
-- ============================================================

SELECT
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
HAVING COUNT(DISTINCT o.order_id) > 1
ORDER BY total_orders DESC;


-- ============================================================
-- 9. MONTHLY REVENUE TREND
-- Concept: JOIN, Aggregation, GROUP BY
-- ============================================================

SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS order_month,
    SUM(oi.price) AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m')
ORDER BY order_month;


-- ============================================================
-- 10. AVERAGE ORDER VALUE BY CUSTOMER STATE
-- Concept: Multiple JOINs, Aggregation, GROUP BY
-- ============================================================

SELECT
    c.customer_state,
    SUM(oi.price) / COUNT(DISTINCT o.order_id) AS average_order_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY average_order_value DESC;


-- ============================================================
-- 11. PAYMENT VALUE BY PAYMENT TYPE
-- Concept: Aggregation, GROUP BY, ORDER BY
-- ============================================================

SELECT
    payment_type,
    SUM(payment_value) AS total_payment_value
FROM payments
GROUP BY payment_type
ORDER BY total_payment_value DESC;


-- ============================================================
-- 12. TOP 10 PRODUCT CATEGORIES BY NUMBER OF ORDERS
-- Concept: JOIN, Aggregation, GROUP BY, DISTINCT, LIMIT
-- ============================================================

SELECT
    p.product_category_name,
    COUNT(DISTINCT oi.order_id) AS total_orders
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY total_orders DESC
LIMIT 10;


-- ============================================================
-- 13. AVERAGE REVIEW SCORE BY PRODUCT CATEGORY
-- Concept: Multiple JOINs, Aggregation, GROUP BY
-- ============================================================

SELECT
    p.product_category_name,
    AVG(CAST(r.review_score AS DECIMAL(10,2))) AS average_review_score
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN reviews r
    ON oi.order_id = r.order_id
GROUP BY p.product_category_name
ORDER BY average_review_score DESC;


-- ============================================================
-- 14. REVIEW SCORE DISTRIBUTION
-- Concept: Aggregation, GROUP BY, ORDER BY
-- ============================================================

SELECT
    review_score,
    COUNT(*) AS review_count
FROM reviews
GROUP BY review_score
ORDER BY review_score;


-- ============================================================
-- 15. PRODUCT CATEGORIES WITH ABOVE-AVERAGE REVENUE
-- Concept: JOIN, Aggregation, GROUP BY, HAVING, SUBQUERY
-- ============================================================

SELECT
    p.product_category_name,
    SUM(oi.price) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_category_name
HAVING SUM(oi.price) > (
    SELECT AVG(category_revenue)
    FROM (
        SELECT
            p2.product_category_name,
            SUM(oi2.price) AS category_revenue
        FROM products p2
        JOIN order_items oi2
            ON p2.product_id = oi2.product_id
        GROUP BY p2.product_category_name
    ) AS category_summary
)
ORDER BY total_revenue DESC;


-- ============================================================
-- END OF SQL SCRIPT
-- ============================================================
