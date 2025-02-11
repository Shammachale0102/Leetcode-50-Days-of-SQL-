/* Percentage of Users Attended a Contest:

Table: Users

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| user_id     | int     |
| user_name   | varchar |
+-------------+---------+
user_id is the primary key (column with unique values) for this table.
Each row of this table contains the name and the id of a user.*/

# Write your MySQL query statement below
WITH TotalUsers AS (
    SELECT COUNT(DISTINCT user_id) AS total_users
    FROM Users
),
ContestRegistrations AS (
    SELECT contest_id, COUNT(DISTINCT user_id) AS users_registered
    FROM Register
    GROUP BY contest_id
)
SELECT cr.contest_id,
       ROUND((cr.users_registered * 100.0) / tu.total_users, 2) AS percentage
FROM ContestRegistrations cr
CROSS JOIN TotalUsers tu
ORDER BY percentage DESC, cr.contest_id ASC;


