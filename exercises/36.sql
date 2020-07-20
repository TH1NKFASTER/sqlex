SELECT name 
  FROM Ships
 WHERE name = class

UNION

SELECT ship AS name
  FROM Outcomes 
      INNER JOIN Classes 
      ON Classes.class = Outcomes.ship
