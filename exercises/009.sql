SELECT DISTINCT maker
  FROM product
           INNER JOIN pc
           ON product.model = pc.model
 WHERE pc.speed >= 450
