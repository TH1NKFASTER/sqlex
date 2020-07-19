SELECT ship 
  FROM Outcomes
 WHERE battle LIKE '%North Atlantic%'
   AND result = 'sunk'
