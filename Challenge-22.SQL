/*Game Play Analysis IV:

Table: Activity

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
(player_id, event_date) is the primary key (combination of columns with unique values) of this table.
This table shows the activity of players of some games.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.*/

# Write your MySQL query statement below
WITH FirstLogin AS (
    -- Get the first login date of each player
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
)
SELECT 
    ROUND(COUNT(DISTINCT a1.player_id) / COUNT(DISTINCT f.player_id), 2) AS fraction
FROM FirstLogin f
LEFT JOIN Activity a1 
ON f.player_id = a1.player_id AND a1.event_date = DATE_ADD(f.first_login, INTERVAL 1 DAY);


