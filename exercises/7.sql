SELECT DISTINCT Product.model AS model, price
  FROM Product
      INNER JOIN PC
      ON Product.model = PC.model
 WHERE maker LIKE '%B%'

UNION

SELECT DISTINCT Product.model AS model, price
  FROM Product
      INNER JOIN Laptop
      ON Product.model = Laptop.model
WHERE maker LIKE '%B%'

UNION

SELECT DISTINCT Product.model AS model, price
  FROM Product
      INNER JOIN Printer
      ON Product.model = Printer.model
 WHERE maker LIKE '%B%'
