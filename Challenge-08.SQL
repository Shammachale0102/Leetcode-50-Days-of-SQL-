/*Customer Who Visited but Did Not Make Any Transactions:

Table: Visits

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| visit_id    | int     |
| customer_id | int     |
+-------------+---------+
visit_id is the column with unique values for this table.
This table contains information about the customers who visited the mall.*/
# Write your MySQL query statement below
SELECT
    v.customer_id,
    COUNT(v.visit_id) AS count_no_trans
FROM
    Visits v
LEFT JOIN
    Transactions t
ON
    v.visit_id = t.visit_id
WHERE
    t.visit_id IS NULL
GROUP BY
    v.customer_id;
