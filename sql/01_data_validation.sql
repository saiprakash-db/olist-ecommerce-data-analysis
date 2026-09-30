-- ============================================================
-- Olist E-Commerce Data Analysis
-- 01 - Data Validation
-- Purpose: Validate row counts, key uniqueness, nulls,
--          and basic referential integrity of cleaned tables.
-- ============================================================


-- ------------------------------------------------------------
-- 1. Row counts for all cleaned tables
-- ------------------------------------------------------------

SELECT 'customers' AS table_name, COUNT(*) AS row_count
FROM workspace.default.olist_customers_cleaned

UNION ALL

SELECT 'geolocation', COUNT(*)
FROM workspace.default.olist_geolocation_cleaned

UNION ALL

SELECT 'order_items', COUNT(*)
FROM workspace.default.olist_order_items_cleaned

UNION ALL

SELECT 'order_payments', COUNT(*)
FROM workspace.default.olist_order_payments_cleaned

UNION ALL

SELECT 'order_reviews', COUNT(*)
FROM workspace.default.olist_order_reviews_cleaned

UNION ALL

SELECT 'orders', COUNT(*)
FROM workspace.default.olist_orders_cleaned

UNION ALL

SELECT 'products', COUNT(*)
FROM workspace.default.olist_products_cleaned

UNION ALL

SELECT 'sellers', COUNT(*)
FROM workspace.default.olist_sellers_cleaned

UNION ALL

SELECT 'category_translation', COUNT(*)
FROM workspace.default.product_category_name_translation_cleaned;


-- ------------------------------------------------------------
-- 2. Check primary-key uniqueness
-- ------------------------------------------------------------

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT customer_id) AS unique_customer_ids
FROM workspace.default.olist_customers_cleaned;


SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_id) AS unique_order_ids
FROM workspace.default.olist_orders_cleaned;


SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT product_id) AS unique_product_ids
FROM workspace.default.olist_products_cleaned;


SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT seller_id) AS unique_seller_ids
FROM workspace.default.olist_sellers_cleaned;


-- ------------------------------------------------------------
-- 3. Check important NULL values
-- ------------------------------------------------------------

SELECT
    COUNT(*) AS total_orders,
    COUNT(order_id) AS non_null_order_ids,
    COUNT(*) - COUNT(order_id) AS null_order_ids
FROM workspace.default.olist_orders_cleaned;


SELECT
    COUNT(*) AS total_customers,
    COUNT(customer_id) AS non_null_customer_ids,
    COUNT(*) - COUNT(customer_id) AS null_customer_ids
FROM workspace.default.olist_customers_cleaned;


SELECT
    COUNT(*) AS total_order_items,
    COUNT(order_id) AS non_null_order_ids,
    COUNT(product_id) AS non_null_product_ids,
    COUNT(seller_id) AS non_null_seller_ids
FROM workspace.default.olist_order_items_cleaned;


-- ------------------------------------------------------------
-- 4. Check order-item foreign keys
-- ------------------------------------------------------------

SELECT
    COUNT(*) AS total_order_items,
    COUNT(o.order_id) AS valid_order_ids,
    COUNT(p.product_id) AS valid_product_ids,
    COUNT(s.seller_id) AS valid_seller_ids
FROM workspace.default.olist_order_items_cleaned oi
LEFT JOIN workspace.default.olist_orders_cleaned o
    ON oi.order_id = o.order_id
LEFT JOIN workspace.default.olist_products_cleaned p
    ON oi.product_id = p.product_id
LEFT JOIN workspace.default.olist_sellers_cleaned s
    ON oi.seller_id = s.seller_id;


-- ------------------------------------------------------------
-- 5. Check order status distribution
-- ------------------------------------------------------------

SELECT
    order_status,
    COUNT(*) AS order_count
FROM workspace.default.olist_orders_cleaned
GROUP BY order_status
ORDER BY order_count DESC;


-- ------------------------------------------------------------
-- 6. Check order date range
-- ------------------------------------------------------------

SELECT
    MIN(order_purchase_timestamp) AS earliest_order,
    MAX(order_purchase_timestamp) AS latest_order
FROM workspace.default.olist_orders_cleaned;


-- ------------------------------------------------------------
-- 7. Check delivery-date completeness
-- ------------------------------------------------------------

SELECT
    COUNT(*) AS total_orders,
    COUNT(order_delivered_customer_date) AS orders_with_delivery_date,
    COUNT(*) - COUNT(order_delivered_customer_date)
        AS orders_without_delivery_date
FROM workspace.default.olist_orders_cleaned;


-- ------------------------------------------------------------
-- 8. Check for impossible delivery dates
-- ------------------------------------------------------------

SELECT
    COUNT(*) AS invalid_delivery_dates
FROM workspace.default.olist_orders_cleaned
WHERE order_delivered_customer_date < order_purchase_timestamp;


-- ============================================================
-- End of Data Validation
-- ============================================================