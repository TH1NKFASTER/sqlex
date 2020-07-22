SELECT Classes.class, COUNT(name) 
  FROM  Classes 
      LEFT JOIN (SELECT ship AS name, class 
                   FROM Ships 
                       RIGHT JOIN Outcomes 
                       ON Ships.name = Outcomes.ship 
                  WHERE result = 'sunk') AS x 
      ON Classes.class = x.class 
         OR Classes.class = x.name
 GROUP BY Classes.class
