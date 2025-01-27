/*Confirmation Rate:

Table: Signups

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| user_id        | int      |
| time_stamp     | datetime |
+----------------+----------+
user_id is the column of unique values for this table.
Each row contains information about the signup time for the user with ID user_id.*/
# Write your MySQL query statement below
WITH ConfirmationStats AS (
    SELECT 
        c.user_id,
        SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) AS confirmed_count,
        COUNT(*) AS total_requests
    FROM Confirmations c
    GROUP BY c.user_id
),
UserStats AS (
    SELECT 
        s.user_id,
        COALESCE(cs.confirmed_count, 0) AS confirmed_count,
        COALESCE(cs.total_requests, 0) AS total_requests
    FROM Signups s
    LEFT JOIN ConfirmationStats cs
    ON s.user_id = cs.user_id
)
SELECT 
    user_id,
    ROUND(
        CASE 
            WHEN total_requests = 0 THEN 0
            ELSE confirmed_count * 1.0 / total_requests
        END, 2
    ) AS confirmation_rate
FROM UserStats
ORDER BY user_id;
