/* Exercise 3. How many distinct dates are there in the saledate column of the transaction
table for each month/year/store combination in the database? Sort your results by the
number of days per combination in ascending order. */ 

SELECT EXTRACT(YEAR from saledate)||EXTRACT(MONTH from saledate)||store AS year_month_store,
       COUNT(DISTINCT saledate) AS days
FROM trnsact
GROUP BY year_month_store
ORDER BY days;