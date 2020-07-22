SELECT class
  FROM(SELECT class, name
         FROM Ships
       
       UNION
       
       SELECT class, ship AS name
         FROM Classes
             INNER JOIN Outcomes
             ON Outcomes.ship = Classes.class) AS x
 GROUP BY class
HAVING COUNT(class) = 1
