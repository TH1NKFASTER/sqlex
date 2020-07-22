SELECT DISTINCT maker, Printer.price AS price
  FROM Product
      INNER JOIN Printer
      ON Printer.model = Product.model
 WHERE Printer.color = 'y'
   AND price <= ALL(SELECT MIN(price)
                      FROM Printer WHERE color = 'y')
