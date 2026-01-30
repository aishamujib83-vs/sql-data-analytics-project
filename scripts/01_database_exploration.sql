/* 
================================
Database Exploration 
================================
Purpose:
    - To explore the structure of the database, including the list of tables and their schemas.
    - To inspect the columns and metadata for gold schema.

Table Used:
    - INFORMATION_SCHEMA.TABLES
    - INFORMATION_SCHEMA.COLUMNS
=============================================================================== */
-- Explore All Objects In the Database
SELECT	
	TABLE_CATALOG, 
    TABLE_SCHEMA, 
    TABLE_NAME, 
    TABLE_TYPE 
FROM	INFORMATION_SCHEMA.TABLES
ORDER BY 2

-- Explore All Table Columns In the 'gold' Schema
SELECT 
	COLUMN_NAME, 
    DATA_TYPE, 
    IS_NULLABLE, 
    CHARACTER_MAXIMUM_LENGTH
FROM	INFORMATION_SCHEMA.COLUMNS
WHERE	TABLE_SCHEMA = 'gold'