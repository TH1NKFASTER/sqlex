SELECT DISTINCT maker
  FROM Product 
      INNER JOIN PC
      ON Product.model = PC.model 
 WHERE type = 'PC' 
   AND speed >= 750

INTERSECT 

SELECT DISTINCT maker 
  FROM Product 
      INNER JOIN Laptop 
      ON Product.model = Laptop.model 
 WHERE type = 'Laptop' 
   AND speed >=750
