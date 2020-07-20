SELECT DISTINCT a.ship
  FROM (SELECT ship, result, date, battle 
          FROM Outcomes 
              INNER JOIN Battles 
              ON Outcomes.battle = Battles.name) AS a, 
        (SELECT ship, result, date, battle
           FROM Outcomes 
               INNER JOIN Battles 
               ON Outcomes.battle = Battles.name) AS b
 WHERE a.result = 'damaged'
       AND a.date <= b.date
       AND a.ship = b.ship 
       AND a.battle != b.battle
