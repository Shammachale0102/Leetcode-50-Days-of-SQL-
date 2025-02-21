/*Restaurant Growth:

Table: Customer

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| name          | varchar |
| visited_on    | date    |
| amount        | int     |
+---------------+---------+
In SQL,(customer_id, visited_on) is the primary key for this table.
This table contains data about customer transactions in a restaurant.
visited_on is the date on which the customer with ID (customer_id) has visited the restaurant.
amount is the total paid by a customer.
 

You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).

Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.

Return the result table ordered by visited_on in ascending order.*/

# Write your MySQL query statement below
WITH DailyRevenue AS (
    SELECT visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
)

SELECT 
    dr1.visited_on, 
    SUM(dr2.amount) AS amount,
    ROUND(AVG(dr2.amount), 2) AS average_amount
FROM DailyRevenue dr1
JOIN DailyRevenue dr2
    ON dr2.visited_on BETWEEN dr1.visited_on - INTERVAL 6 DAY AND dr1.visited_on
GROUP BY dr1.visited_on
HAVING COUNT(dr2.visited_on) = 7 
ORDER BY dr1.visited_on;
