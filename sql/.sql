USE sales_analysis;

-- 1. Total records
SELECT COUNT(*) AS total_records
FROM sales;

-- 2. Overall sales and profit
SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity
FROM sales;

-- 3. Total orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM sales;

-- 4. Profit margin
SELECT
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM sales;