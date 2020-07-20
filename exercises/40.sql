SELECT maker, MAX(DISTINCT type) 
  FROM Product 
 GROUP BY maker
HAVING COUNT(DISTINCT type) = 1
       AND COUNT(model) > 1
