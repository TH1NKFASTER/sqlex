SELECT maker, COUNT(model) 
  FROM Product 
 WHERE type = 'PC' 
 GROUP BY maker 
HAVING COUNT(model) >= 3
