/* Not Boring Movies:

Table: Cinema

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| id             | int      |
| movie          | varchar  |
| description    | varchar  |
| rating         | float    |
+----------------+----------+
id is the primary key (column with unique values) for this table.
Each row contains information about the name of a movie, its genre, and its rating.*/

# Write your MySQL query statement below
SELECT id, movie, description, rating
FROM Cinema
WHERE id % 2 = 1  -- This filters for odd IDs
  AND description != 'boring'  -- This excludes "boring" descriptions
ORDER BY rating DESC;  -- Orders the results by rating in descending order


