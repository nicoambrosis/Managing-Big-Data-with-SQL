/* Exercise 5. What is the average daily revenue brought in by Dillard’s stores in areas of
high, medium, or low levels of high school education? */ 

SELECT CASE WHEN msa_high >= 50 and msa_high <= 60 THEN 'low'
             WHEN msa_high > 60 and msa_high <= 70 THEN 'medium'
             WHEN msa_high > 70 THEN 'high'               
             END AS school_class,
             SUM(total_revenue) /SUM(total_sale_dates) AS avg_edu

FROM store_msa s JOIN (SELECT store, EXTRACT(YEAR from saledate)||EXTRACT(MONTH from saledate)||store AS year_month_sotore,
                       SUM(amt) AS total_revenue,
                       count(distinct(saledate)) AS total_sale_dates,
                       total_revenue/total_sale_dates AS daily_revenue 
                       FROM trnsact
                       WHERE stype = 'P' AND NOT 
                      (EXTRACT(YEAR from saledate)=2005 AND EXTRACT(MONTH from saledate)=8)
                       GROUP BY year_month_sotore,store
                       HAVING COUNT(DISTINCT saledate)>20 )as clean_table ON s.store = clean_table.store
GROUP BY school_class
;