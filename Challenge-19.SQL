/*Queries Quality and Percentage:

Table: Queries

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| query_name  | varchar |
| result      | varchar |
| position    | int     |
| rating      | int     |
+-------------+---------+
This table may have duplicate rows.
This table contains information collected from some queries on a database.
The position column has a value from 1 to 500.
The rating column has a value from 1 to 5. Query with rating less than 3 is a poor query.*/

# Write your MySQL query statement below
WITH QueryStats AS (
    SELECT 
        query_name,
        AVG(rating * 1.0 / position) AS quality,
        100.0 * SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / COUNT(*) AS poor_query_percentage
    FROM Queries
    GROUP BY query_name
)
SELECT 
    query_name,
    ROUND(quality, 2) AS quality,
    ROUND(poor_query_percentage, 2) AS poor_query_percentage
FROM QueryStats;
