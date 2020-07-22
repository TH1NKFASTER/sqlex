SELECT model, price 
  FROM printer 
 WHERE price = (SELECT max(price) FROM Printer)
