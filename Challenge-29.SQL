/*Customers Who Bought All Products:

Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| customer_id | int     |
| product_key | int     |
+-------------+---------+
This table may contain duplicates rows. 
customer_id is not NULL.
product_key is a foreign key (reference column) to Product table*/

# Write your MySQL query statement below
WITH ProductCount AS (
    SELECT COUNT(*) AS total_products FROM Product
),
CustomerProductCount AS (
    SELECT customer_id, COUNT(DISTINCT product_key) AS bought_products
    FROM Customer
    GROUP BY customer_id
)
SELECT c.customer_id
FROM CustomerProductCount c
JOIN ProductCount p
ON c.bought_products = p.total_products;


