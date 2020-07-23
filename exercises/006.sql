SELECT DISTINCT maker, laptop.speed AS speed
  FROM product
           INNER JOIN laptop
           ON laptop.model = product.model
 WHERE hd >= 10
