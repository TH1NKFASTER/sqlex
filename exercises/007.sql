SELECT DISTINCT product.model AS model, price
  FROM product
           INNER JOIN pc
           ON product.model = pc.model
 WHERE maker LIKE '%B%'

 UNION

SELECT DISTINCT product.model AS model, price
  FROM product
           INNER JOIN laptop
           ON product.model = laptop.model
 WHERE maker LIKE '%B%'

 UNION

SELECT DISTINCT product.model AS model, price
  FROM product
           INNER JOIN printer
           ON product.model = printer.model
 WHERE maker LIKE '%B%'
