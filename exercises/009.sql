SELECT DISTINCT maker
  FROM Product
      INNER JOIN PC
      ON Product.model = PC.model
 WHERE PC.speed >= 450
