SELECT maker, AVG(Laptop.screen) 
  FROM Product 
      INNER JOIN Laptop
      ON Product.model = Laptop.model
 GROUP BY maker
