/* Exercise 9: What was the average daily revenue Dillard’s brought in during each month of
the year? */

SELECT 
       EXTRACT(MONTH from saledate) AS months,
       SUM(amt)/COUNT(DISTINCT saledate) AS daily_revenue 
FROM trnsact
WHERE stype = 'P' AND NOT 
      (EXTRACT(YEAR from saledate)=2005 AND EXTRACT(MONTH from saledate)=8) AND
       (EXTRACT(YEAR from saledate)||EXTRACT(MONTH from saledate)||store) IN (SELECT (EXTRACT(YEAR from saledate)||EXTRACT(MONTH from saledate)||store)
                            FROM trnsact
                            GROUP BY (EXTRACT(YEAR from saledate)||EXTRACT(MONTH from saledate)||store)
                            HAVING COUNT(DISTINCT saledate)>20) 
GROUP BY months
ORDER BY daily_revenue DESC;