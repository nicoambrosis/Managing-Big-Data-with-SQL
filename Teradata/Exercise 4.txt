Exercise 4. What is the average daily revenue for each store/month/year combination in
the database? Calculate this by dividing the total revenue for a group by the number of
sales days available in the transaction table for that group.  

SELECT EXTRACT(YEAR from saledate)||EXTRACT(MONTH from saledate)||store AS year_month_sotre,
       SUM(amt)/COUNT(DISTINCT saledate) AS daily_revenue 
FROM trnsact
WHERE stype = 'P' AND NOT 
      (EXTRACT(YEAR from saledate)=2005 AND EXTRACT(MONTH from saledate)=8) AND
       year_month_sotre IN (SELECT (EXTRACT(YEAR from saledate)||EXTRACT(MONTH from saledate)||store)
                            FROM trnsact
                            GROUP BY (EXTRACT(YEAR from saledate)||EXTRACT(MONTH from saledate)||store)
                            HAVING COUNT(DISTINCT saledate)>20) 
GROUP BY year_month_sotre
ORDER BY year_month_sotre DESC;