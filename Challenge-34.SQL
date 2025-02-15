/*Product Price at a Given Date:

Table: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) is the primary key (combination of columns with unique values) of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.
 

Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

Return the result table in any order.*/

# Write your MySQL query statement below
WITH latest_prices AS (
    SELECT product_id, new_price, change_date
    FROM Products
    WHERE change_date <= '2019-08-16'
)
SELECT 
    p.product_id, 
    COALESCE(lp.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) p
LEFT JOIN (
    SELECT product_id, new_price 
    FROM latest_prices 
    WHERE (product_id, change_date) IN (
        SELECT product_id, MAX(change_date) 
        FROM latest_prices 
        GROUP BY product_id
    )
) lp
ON p.product_id = lp.product_id;
