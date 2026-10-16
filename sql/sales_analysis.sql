-- =====================================================
-- PROJECT: SALES ANALYSIS USING SQL
-- DATABASE: sales_analysis
-- DATASET: Sample Superstore
-- =====================================================

USE sales_analysis;


-- =====================================================
-- 1. DATASET OVERVIEW
-- =====================================================

-- Total records
SELECT COUNT(*) AS total_records
FROM sales;

-- View first 10 records
SELECT *
FROM sales
LIMIT 10;

-- Check date range
SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM sales;


-- =====================================================
-- 2. DATA QUALITY CHECK
-- =====================================================

-- Check missing important values
SELECT
    SUM(order_id IS NULL) AS missing_order_ids,
    SUM(product_name IS NULL) AS missing_products,
    SUM(order_date IS NULL) AS missing_order_dates,
    SUM(sales IS NULL) AS missing_sales,
    SUM(profit IS NULL) AS missing_profit
FROM sales;


-- =====================================================
-- 3. OVERALL BUSINESS KPIs
-- =====================================================

SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM sales;


-- =====================================================
-- 4. TOP 10 PRODUCTS BY SALES
-- =====================================================

SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;


-- =====================================================
-- 5. MONTHLY SALES AND PROFIT TRENDS
-- =====================================================

SELECT
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    ROUND(SUM(sales), 2) AS monthly_revenue,
    ROUND(SUM(profit), 2) AS monthly_profit
FROM sales
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    sales_year,
    sales_month;


-- =====================================================
-- 6. TOP 5 MONTHS BY REVENUE
-- =====================================================

SELECT
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    ROUND(SUM(sales), 2) AS monthly_revenue,
    ROUND(SUM(profit), 2) AS monthly_profit
FROM sales
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY monthly_revenue DESC
LIMIT 5;


-- =====================================================
-- 7. YEARLY SALES PERFORMANCE
-- =====================================================

SELECT
    YEAR(order_date) AS sales_year,
    ROUND(SUM(sales), 2) AS annual_revenue,
    ROUND(SUM(profit), 2) AS annual_profit,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY YEAR(order_date)
ORDER BY sales_year;


-- =====================================================
-- 8. REGIONAL SALES PERFORMANCE
-- =====================================================

SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM sales
GROUP BY region
ORDER BY total_sales DESC;


-- =====================================================
-- 9. LOSS-MAKING PRODUCTS
-- =====================================================

SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC
LIMIT 10;


-- =====================================================
-- 10. CATEGORY-WISE PERFORMANCE
-- =====================================================

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM sales
GROUP BY category
ORDER BY total_profit DESC;


-- =====================================================
-- 11. SUB-CATEGORY PERFORMANCE
-- =====================================================

SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY category, sub_category
ORDER BY total_profit DESC;


-- =====================================================
-- 12. CUSTOMER SEGMENT ANALYSIS
-- =====================================================

SELECT
    segment,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY segment
ORDER BY total_sales DESC;


-- =====================================================
-- 13. DISCOUNT AND PROFIT ANALYSIS
-- =====================================================

SELECT
    discount,
    COUNT(*) AS order_lines,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY discount
ORDER BY discount;


-- =====================================================
-- 14. SHIPPING MODE ANALYSIS
-- =====================================================

SELECT
    ship_mode,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY ship_mode
ORDER BY total_sales DESC;


-- =====================================================
-- 15. FINAL PROJECT KPI SUMMARY
-- =====================================================

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS units_sold
FROM sales;

SELECT
    discount,
    COUNT(*) AS order_lines,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY discount
ORDER BY discount;

USE sales_analysis;

SELECT
    ship_mode,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM sales
GROUP BY ship_mode
ORDER BY total_sales DESC;

-- DISCOUNT ANALYSIS

SELECT
    discount,
    COUNT(*) AS order_lines,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY discount
ORDER BY discount;

SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC
LIMIT 10;