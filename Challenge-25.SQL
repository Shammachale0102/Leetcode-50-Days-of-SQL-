/*Product Sales Analysis III:

Table: Sales

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+
(sale_id, year) is the primary key (combination of columns with unique values) of this table.
product_id is a foreign key (reference column) to Product table.
Each row of this table shows a sale on the product product_id in a certain year.
Note that the price is per unit.*/

# Write your MySQL query statement below
WITH FirstSales AS (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
)
SELECT s.product_id, f.first_year, s.quantity, s.price
FROM Sales s
JOIN FirstSales f 
ON s.product_id = f.product_id AND s.year = f.first_year;
