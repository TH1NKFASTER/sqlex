SELECT maker, MAX(price) 
  FROM PC 
      INNER JOIN Product 
      ON Product.model = PC.model 
GROUP BY maker
