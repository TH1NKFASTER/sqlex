SELECT maker
  FROM Product
 WHERE type = 'PC' EXCEPT
SELECT maker
  FROM Product
           LEFT JOIN PC
           ON Product.model = PC.model
 WHERE type = 'PC'
   AND PC.model IS NULL
