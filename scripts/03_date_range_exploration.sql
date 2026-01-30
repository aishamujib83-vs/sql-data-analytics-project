/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/
-- Find the date of first order and last order date
-- How many year of sales available?
SELECT  
	MIN(order_date) as first_order_date, 
	MAX(order_date) as last_order_date,
	DATEDIFF(YEAR,MIN(order_date),MAX(order_date)) as order_range_year
FROM	gold.fact_sales

-- Find the youngest and oldest Customer
SELECT	
MIN(DATEDIFF(YEAR,birthdate,GETDATE())) as youngest_age,
MAX(DATEDIFF(YEAR,birthdate,GETDATE())) as oldest_age
FROM	gold.dim_customers