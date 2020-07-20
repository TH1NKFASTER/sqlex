SELECT country, CAST(AVG(POW(bore, 3) / 2) AS NUMERIC(10, 2)) 
  FROM(SELECT country, Classes.class, name, bore 
         FROM Classes
             INNER JOIN Ships
             ON Classes.class = Ships.class

       UNION 

      (SELECT country, class, ship, bore
         FROM Classes
             INNER JOIN Outcomes 
             ON Classes.class = Outcomes.ship)) AS x
 GROUP BY country
