SELECT model, speed, hd
  FROM pc
 WHERE (cd = '24x' OR cd = '12x')
   AND price < 600
