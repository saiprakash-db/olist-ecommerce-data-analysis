-- ============================================================
-- Olist E-Commerce Data Analysis
-- 02 - Business Analysis
-- Purpose: Analyze sales performance, customers, products,
--          sellers, payments, delivery, and reviews.
-- ============================================================
-- ============================================================
-- 1. OVERALL SALES PERFORMANCE
-- Purpose: Calculate total orders, product revenue,
--          freight value, total order value, and AOV.
-- ============================================================

SELECT
    COUNT(DISTINCT oi.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS product_revenue_brl,
    ROUND(SUM(oi.freight_value), 2) AS freight_value_brl,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS total_order_value_brl,
    ROUND(
        SUM(oi.price + oi.freight_value)
        / COUNT(DISTINCT oi.order_id),
        2
    ) AS average_order_value_brl
FROM workspace.default.olist_order_items_cleaned oi;

-- ============================================================
-- 2. MONTHLY REVENUE TREND
-- Purpose: Analyze monthly order volume, product revenue,
--          and freight value over time.
-- Note: September 2018 is excluded because it contains
--       only 1 order and represents an incomplete final period.
-- ============================================================

SELECT
    DATE_FORMAT(o.order_purchase_timestamp, 'yyyy-MM') AS order_month,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS product_revenue_brl,
    ROUND(SUM(oi.freight_value), 2) AS freight_value_brl
FROM workspace.default.olist_orders_cleaned o
JOIN workspace.default.olist_order_items_cleaned oi
    ON o.order_id = oi.order_id
WHERE DATE_FORMAT(o.order_purchase_timestamp, 'yyyy-MM') <> '2018-09'
GROUP BY DATE_FORMAT(o.order_purchase_timestamp, 'yyyy-MM')
ORDER BY order_month;

-- ============================================================
-- 3. PRODUCT CATEGORY PERFORMANCE
-- Purpose: Compare product categories by order volume,
--          product revenue, and revenue per order.
-- ============================================================

SELECT
    COALESCE(
        t.product_category_name_english,
        p.product_category_name
    ) AS product_category,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS product_revenue_brl,
    ROUND(
        SUM(oi.price) / COUNT(DISTINCT oi.order_id),
        2
    ) AS revenue_per_order_brl
FROM workspace.default.olist_order_items_cleaned oi
JOIN workspace.default.olist_products_cleaned p
    ON oi.product_id = p.product_id
LEFT JOIN workspace.default.product_category_name_translation_cleaned t
    ON p.product_category_name = t.product_category_name
GROUP BY
    COALESCE(
        t.product_category_name_english,
        p.product_category_name
    )
ORDER BY product_revenue_brl DESC;

-- ============================================================
-- 4. PAYMENT METHOD PERFORMANCE
-- Purpose: Compare payment methods by transaction count,
--          total payment value, and average payment value.
-- ============================================================

SELECT
    payment_type,
    COUNT(*) AS payment_records,
    ROUND(SUM(payment_value), 2) AS total_payment_value_brl,
    ROUND(AVG(payment_value), 2) AS average_payment_value_brl
FROM workspace.default.olist_order_payments_cleaned
GROUP BY payment_type
ORDER BY total_payment_value_brl DESC;

-- ============================================================
-- 5. SELLER PERFORMANCE
-- Purpose: Identify the top sellers by order volume
--          and product revenue.
-- ============================================================

SELECT
    oi.seller_id,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS product_revenue_brl
FROM workspace.default.olist_order_items_cleaned oi
GROUP BY oi.seller_id
ORDER BY product_revenue_brl DESC
LIMIT 10;

-- ============================================================
-- 6. CUSTOMER GEOGRAPHY
-- Purpose: Analyze customer distribution and product revenue
--          across Brazilian states.
-- ============================================================

SELECT
    c.customer_state,
    COUNT(DISTINCT c.customer_unique_id) AS total_customers,
    ROUND(SUM(oi.price), 2) AS product_revenue_brl
FROM workspace.default.olist_customers_cleaned c
JOIN workspace.default.olist_orders_cleaned o
    ON c.customer_id = o.customer_id
JOIN workspace.default.olist_order_items_cleaned oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY product_revenue_brl DESC;

-- ============================================================
-- 7. DELIVERY TIME VS REVIEW SCORE
-- Purpose: Compare average delivery time across different
--          customer review scores.
-- Note: This shows association, not causation.
-- ============================================================

SELECT
    r.review_score,
    COUNT(DISTINCT r.order_id) AS total_reviews,
    ROUND(
        AVG(
            DATEDIFF(
                CAST(o.order_delivered_customer_date AS DATE),
                CAST(o.order_purchase_timestamp AS DATE)
            )
        ),
        2
    ) AS average_delivery_days
FROM workspace.default.olist_order_reviews_cleaned r
JOIN workspace.default.olist_orders_cleaned o
    ON r.order_id = o.order_id
WHERE r.review_score BETWEEN 1 AND 5
  AND o.order_delivered_customer_date IS NOT NULL
GROUP BY r.review_score
ORDER BY r.review_score;

-- ============================================================
-- 8. REVIEW SCORE DISTRIBUTION
-- Purpose: Analyze the distribution of valid customer
--          review scores and their percentage share.
-- ============================================================

SELECT
    review_score,
    COUNT(*) AS total_reviews,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS review_percentage
FROM workspace.default.olist_order_reviews_cleaned
WHERE review_score BETWEEN 1 AND 5
GROUP BY review_score
ORDER BY review_score;

-- ============================================================
-- 9. ORDER STATUS ANALYSIS
-- Purpose: Analyze order volume and product revenue
--          across different order statuses.
-- ============================================================

SELECT
    o.order_status,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS product_revenue_brl
FROM workspace.default.olist_orders_cleaned o
LEFT JOIN workspace.default.olist_order_items_cleaned oi
    ON o.order_id = oi.order_id
GROUP BY o.order_status
ORDER BY total_orders DESC;

-- ============================================================
-- 10. PRODUCT VALUE VS FREIGHT VALUE
-- Purpose: Compare product value and freight value
--          within the total order-item value.
-- ============================================================

SELECT
    'Product Value' AS value_type,
    ROUND(SUM(price), 2) AS value_brl,
    ROUND(
        SUM(price) * 100.0 /
        SUM(price + freight_value),
        2
    ) AS percentage_of_total
FROM workspace.default.olist_order_items_cleaned

UNION ALL

SELECT
    'Freight Value' AS value_type,
    ROUND(SUM(freight_value), 2) AS value_brl,
    ROUND(
        SUM(freight_value) * 100.0 /
        SUM(price + freight_value),
        2
    ) AS percentage_of_total
FROM workspace.default.olist_order_items_cleaned;

-- ============================================================
-- 11. TOTAL ORDERS
-- Purpose: Calculate the total number of orders in the dataset.
-- ============================================================

SELECT
    COUNT(*) AS total_orders
FROM workspace.default.olist_orders_cleaned;
