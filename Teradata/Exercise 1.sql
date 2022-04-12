/* Exercise 1. How many distinct dates are there in the saledate column of the transaction
table for each month/year combination in the database? */

SELECT EXTRACT(YEAR from saledate) AS year_num,
               EXTRACT(MONTH from saledate) AS month_num,
               COUNT(DISTINCT saledate)
FROM trnsact
GROUP BY year_num, month_num
ORDER BY year_num ASC, month_num ASC;