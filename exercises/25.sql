SELECT DISTINCT maker
  FROM (SELECT maker, ram, speed
          FROM Product
              INNER JOIN PC
              ON Product.model = PC.model
         WHERE ram <= ALL(SELECT ram FROM PC)) AS x 
 WHERE speed = (SELECT MAX(speed) 
                  FROM (SELECT maker, ram, speed
                          FROM Product 
                              INNER JOIN PC
                              ON Product.model = PC.model
                         WHERE ram <= ALL(SELECT ram 
                                            FROM PC)) AS x)

INTERSECT 

SELECT maker 
  FROM Product 
 WHERE type = 'Printer'
