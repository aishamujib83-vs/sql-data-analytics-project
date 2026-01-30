/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - To rank items (e.g., products, customers) based on performance or other metrics.
    - To identify top performers or laggards.

SQL Functions Used:
    - Window Ranking Functions: RANK(), DENSE_RANK(), ROW_NUMBER(), TOP
    - Clauses: GROUP BY, ORDER BY
===============================================================================
*/

-- Which 5 products generated the highest revenue?
SELECT		TOP 5 p.product_name, SUM(sales_amount) as total_revenue
FROM		gold.fact_sales f 
LEFT JOIN	gold.dim_products p
	ON f.product_key = p.product_key
GROUP BY	p.product_name
ORDER BY	total_revenue desc

-- Above query using Window function
SELECT	product_name,total_revenue
FROM
(
SELECT		
p.product_name, 
SUM(sales_amount) as total_revenue,
ROW_NUMBER() over (order by SUM(sales_amount) desc) rank_number
FROM		gold.fact_sales f 
LEFT JOIN	gold.dim_products p
	ON f.product_key = p.product_key
GROUP BY	p.product_name
) as t
where rank_number <= 5

-- What are the worst performing products in terms of sales?
SELECT		TOP 5 p.product_name, SUM(sales_amount) as total_revenue
FROM		gold.fact_sales f 
LEFT JOIN	gold.dim_products p
	ON f.product_key = p.product_key
GROUP BY	p.product_name
ORDER BY	total_revenue 

-- Find the top 10 customers who generated the highest revenue
SELECT TOP 10
	dc.customer_key, 
	dc.first_name,
	dc.last_name,
	SUM(fs.sales_amount) as total_revenue
FROM	gold.fact_sales fs	
JOIN	gold.dim_customers dc
	ON	fs.customer_key = dc.customer_key
GROUP BY	dc.customer_key,dc.first_name,dc.last_name
ORDER BY total_revenue desc

-- Find the 3 customers who placed fewest orders
SELECT TOP 3
	dc.customer_key, 
	dc.first_name,
	dc.last_name,
	COUNT(DISTINCT order_number) as total_orders
FROM	gold.fact_sales fs	
JOIN	gold.dim_customers dc
	ON	fs.customer_key = dc.customer_key
GROUP BY	dc.customer_key,dc.first_name,dc.last_name
ORDER BY total_orders 
