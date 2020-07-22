SELECT model, speed, hd
  FROM PC
 WHERE (cd = '24x'
    OR cd = '12x')
   AND price < 600
