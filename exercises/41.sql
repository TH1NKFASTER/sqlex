SELECT maker, MAX(price)
  FROM(SELECT DISTINCT maker, price
         FROM Product
             INNER JOIN Printer
             ON Product.model = Printer.model
             
       UNION

       SELECT DISTINCT maker, price
         FROM Product
             INNER JOIN PC
             ON Product.model = PC.model

       UNION

       SELECT DISTINCT maker, price
         FROM Product
             INNER JOIN Laptop
             ON Product.model = Laptop.model) AS x
 WHERE maker NOT IN (SELECT maker
                       FROM Product
                           INNER JOIN PC
                           ON PC.model = Product.model
                      WHERE price IS NULL

                     UNION

                     SELECT maker
                       FROM Product
                           INNER JOIN Laptop
                           ON Product.model = Laptop.model
                      WHERE price IS NULL

                     UNION

                     SELECT maker
                       FROM Product
                           INNER JOIN Printer
                           ON Product.model = Printer.model
                      WHERE price IS NULL)
GROUP BY maker

UNION

SELECT maker, NULL AS price
  FROM Product
      INNER JOIN PC
      ON PC.model = Product.model
 WHERE price IS NULL

UNION

SELECT maker, NULL AS price
  FROM Product
      INNER JOIN Laptop 
      ON Product.model = Laptop.model
 WHERE price IS NULL

UNION

SELECT maker, NULL AS price
  FROM Product 
      INNER JOIN Printer 
      ON Product.model = Printer.model
 WHERE price IS NULL
