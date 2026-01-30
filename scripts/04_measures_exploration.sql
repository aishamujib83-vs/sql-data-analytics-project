/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/
-- Find the total sales
SELECT SUM(sales_amount) as total_sales FROM gold.fact_sales

-- Find how many items are sold
SELECT SUM(quantity) as total_quantity FROM gold.fact_sales

-- Find the average selling price
SELECT AVG(price) as average_price FROM gold.fact_sales

-- Find the total number of orders
SELECT COUNT(order_number) as total_orders FROM gold.fact_sales
SELECT COUNT(DISTINCT order_number) as total_orders FROM gold.fact_sales  

-- Find the total number of products
SELECT COUNT(DISTINCT product_key) as total_products FROM gold.dim_products

-- Find the total number of customers
SELECT COUNT(customer_key) as total_customers FROM gold.dim_customers

-- Find the total number of customers that placed an order
SELECT COUNT(DISTINCT fs.customer_key) as total_customers FROM gold.fact_sales fs

-- Generate report to show all key metrics of the business
SELECT 'Total Sales' as measure_name,SUM(sales_amount) as measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity' as measure_name,SUM(quantity) as measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Average Price' as measure_name,AVG(price) as measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Orders' as measure_name,COUNT(DISTINCT order_number) as measure_value FROM gold.fact_sales  
UNION ALL
SELECT 'Total Products' as measure_name,COUNT(DISTINCT product_key) as measure_value FROM gold.dim_products
UNION ALL
SELECT 'Total Customers' as measure_name,COUNT(customer_key) as measure_value FROM gold.dim_customers