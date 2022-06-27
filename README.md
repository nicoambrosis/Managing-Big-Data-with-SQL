# Managing-Big-Data-with-SQL
Material from the ¨Managing Big Data with SQL¨ course from Duke University

<p align="center"> 
  <a href="https://www.teradata.com/" target="_blank" rel="noreferrer"> <img src="https://github.com/nicoambrosis/Managing-Big-Data-with-SQL/blob/main/Teradata/Teradata_logo_2018.png" alt="teradata" width="180" height="70"/> </a>
  <a href="https://www.mysql.com/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/mysql/mysql-original-wordmark.svg" alt="mysql" width="70" height="70"/> </a>
<a href="https://jupyter.org/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/jupyter/jupyter-original-wordmark.svg" alt="jupyter" width="70" height="70"/> </a>
  
</p>


The Coursera Specialization, "Managing Big Data with MySQL" consists of a 5-week course to learn SQL (MySQL and TERADATA) to interact with complex databases to find relationships between data and create value for business . Two real databases donated by the companies [Dognition](https://www.dognition.com/) and [Dillard's](https://www.dillards.com/) are used to learn from basic to advanced SQL concepts. 






---
The [Dognition](https://www.dognition.com/) database has hundred of thousands of rows is accesible throw mySQL. Exersices were done using Jupyter notebooks. 
You can find some exersices [here](https://github.com/nicoambrosis/Managing-Bid-Data-with-SQL/tree/main/MySQL). 

---
The [Dillard's](https://www.dillards.com/) database has more than 120 million rows and is accesible throw Teradata. Excersices were done using the web based platform for [Teradata](https://www.teradata.com/). 

---
## Queries
Some examples of what I have done in this course.<br>
[Example #1](https://github.com/nicoambrosis/Managing-Big-Data-with-SQL/blob/main/MySQL/MySQL_Exercise_12_Queries_that_Test_Relationships_Between_Test_Completion_and_Testing_Circumstances.ipynb)
```sql
SELECT DATE_SUB(c.created_at,INTERVAL 6 HOUR) AS corrected_time,
    YEAR(DATE_SUB(c.created_at,INTERVAL 6 HOUR)) AS year,
    DAYOFWEEK(DATE_SUB(c.created_at,INTERVAL 6 HOUR)) AS dayasnum,
    COUNT(c.created_at) AS numtests,
    (CASE
    WHEN DAYOFWEEK(c.created_at)=1 THEN "Su"
    WHEN DAYOFWEEK(c.created_at)=2 THEN "Mo"
    WHEN DAYOFWEEK(c.created_at)=3 THEN "Tu"
    WHEN DAYOFWEEK(c.created_at)=4 THEN "We"
    WHEN DAYOFWEEK(c.created_at)=5 THEN "Th"
    WHEN DAYOFWEEK(c.created_at)=6 THEN "Fr"
    WHEN DAYOFWEEK(c.created_at)=7 THEN "Sa"
    END) AS daylabel

FROM complete_tests c JOIN (SELECT DISTINCT dog_guid
                            FROM dogs d JOIN users u ON d.user_guid=u.user_guid 
                            WHERE ((u.exclude IS NULL OR u.exclude=0) AND
                                   (d.exclude IS NULL OR d.exclude=0) AND
                                  (u.country='US') AND
                                  (u.state NOT IN ('HI','AK')))) AS dogs_cleaned
ON c.dog_guid=dogs_cleaned.dog_guid
GROUP BY year, dayasnum
ORDER BY year, FIELD(dayasnum, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')
;
```
<br>

[Example #2](https://github.com/nicoambrosis/Managing-Big-Data-with-SQL/blob/main/MySQL/MySQL_Exercise_11_Queries_that_Test_Relationships_Between_Test_Completion_and_Dog_Characteristics.ipynb)

```sql
SELECT breed_group,
        AVG(numtests_per_dog.numtests) AS avg_tests_completed,
        COUNT(DISTINCT dogID)

FROM(SELECT d.dog_guid AS dogID,
         d.breed_group AS breed_group,
         count(c.created_at) AS numtests
     FROM dogs d JOIN complete_tests c ON d.dog_guid=c.dog_guid
     WHERE d.exclude IS NULL OR d.exclude=0             
    GROUP BY dogID) AS numtests_per_dog
GROUP BY breed_group
HAVING breed_group IN ('Sporting', 'Hound', 'Herding','Working');
```
<br>

[Example #3](https://github.com/nicoambrosis/Managing-Big-Data-with-SQL/blob/main/MySQL/MySQL_Exercise_07_Inner_Joins.ipynb)
```sql
SELECT 
d.dog_guid AS DogID,
d.user_guid AS UerID,
AVG(r.rating) AS AvgRating,
COUNT(r.rating) AS NumRatings,
d.breed,
d.breed_group,
d.breed_type
FROM dogs d, reviews r
WHERE d.dog_guid = r.dog_guid AND d.user_guid = r.user_guid
GROUP BY d.user_guid, d.dog_guid, d.breed, d.breed_group, d.breed_type
HAVING NumRatings >= 10
ORDER BY AvgRating DESC
LIMIT 200;
```


## Acquired skills
### General Skills
Data Analysis, SQL, MySQL, TERADATA

### Specific Skills
* Describe the structure of relational databases
* Interpret and create entity-relationship diagrams and relational schemas that describe the contents of specific databases
* Write queries that retrieve and sort data that meet specific criteria, and retrieve such data from real MySQL and Teradata business databases.
* Execute practices that limit the impact of your queries on other coworkers
* Summarize rows of data using aggregate functions, and segment aggregations according to specified variables
* Combine and manipulate data from multiple tables across a database
* Retrieve records and compute calculations that are dependent on dynamic data features
* Translate data analysis questions into SQL queries that accommodate the types of anomalies found in real data sets.


## Certificate
<p align="center">
  <img src="https://github.com/nicoambrosis/Managing-Bid-Data-with-SQL/blob/main/Certificate.jpg">
</p>

