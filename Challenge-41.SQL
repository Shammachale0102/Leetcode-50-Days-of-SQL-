/*Friend Requests II: Who Has the Most Friends:

Table: RequestAccepted

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+
(requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
 

Write a solution to find the people who have the most friends and the most friends number.

The test cases are generated so that only one person has the most friends.*/

# Write your MySQL query statement below
WITH FriendCounts AS (
    SELECT requester_id AS id, COUNT(DISTINCT accepter_id) AS num
    FROM RequestAccepted
    GROUP BY requester_id
    UNION ALL
    SELECT accepter_id AS id, COUNT(DISTINCT requester_id) AS num
    FROM RequestAccepted
    GROUP BY accepter_id
)

SELECT id, SUM(num) AS num
FROM FriendCounts
GROUP BY id
ORDER BY num DESC
LIMIT 1;
