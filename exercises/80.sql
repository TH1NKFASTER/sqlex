SELECT maker
  FROM product EXCEPT

SELECT maker
  FROM product
 WHERE model NOT IN (SELECT model FROM pc)
   AND type = 'PC'
