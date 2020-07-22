SELECT Classes.class, COUNT(name)
  FROM  Classes
      LEFT JOIN (SELECT ship AS name, class
                   FROM Ships
                       RIGHT JOIN Outcomes
                       ON Ships.name = Outcomes.ship
                  WHERE result = 'sunk') AS x
      ON Classes.class = x.class
         OR Classes.class = x.name
 WHERE Classes.class IN (SELECT class 
                            FROM (SELECT Classes.class AS class, name 
                                    FROM Classes 
                                        INNER JOIN Ships 
                                        ON Classes.class = Ships.class

                         UNION   

                         SELECT class, ship AS name 
                           FROM Classes 
                               INNER JOIN Outcomes 
                               ON ship = class
                          WHERE ship NOT IN (SELECT name 
                                               FROM Ships)) AS x
                          GROUP BY class
                         HAVING(COUNT(name) >= 3))
 GROUP BY Classes.class
HAVING COUNT(name) > 0
