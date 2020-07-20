SELECT Outcomes.ship, Classes.displacement, Classes.numGuns
  FROM Outcomes
      LEFT JOIN Ships 
      ON Ships.name = Outcomes.ship
      LEFT JOIN Classes 
      ON Classes.class = Ships.class 
         OR Classes.class = Outcomes.ship
 WHERE battle SIMILAR TO '%Guadalcanal%'
