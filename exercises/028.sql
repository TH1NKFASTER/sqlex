SELECT COUNT(cnt) AS result 
  FROM (SELECT maker, COUNT(maker) AS cnt 
          FROM Product 
         GROUP BY maker) AS x 
 WHERE cnt = 1
