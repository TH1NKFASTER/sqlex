SELECT x.maker AS maker, type, ROUND(cnt*100.0/all_count, 2)
  FROM(SELECT maker, type, COUNT(*) AS cnt
         FROM Product
        WHERE type = 'PC'
        GROUP BY maker, type

        UNION

        SELECT maker, type, COUNT(*) AS cnt
          FROM Product
         WHERE type = 'Printer'
         GROUP BY maker, type

        UNION

        SELECT maker, type, COUNT(*) AS cnt
          FROM Product
         WHERE type = 'Laptop'
         GROUP BY maker, type

        UNION 

        SELECT maker, 'PC' AS type, 0 AS cnt 
          FROM Product
         WHERE maker NOT IN (SELECT maker 
                               FROM Product 
                              WHERE type = 'PC')
                      
        UNION 

        SELECT maker, 'Printer' AS type, 0 AS cnt 
          FROM Product
         WHERE maker NOT IN (SELECT maker 
                               FROM Product 
                              WHERE type = 'Printer')
                      
        UNION 

        SELECT maker, 'Laptop' AS type, 0 AS cnt 
          FROM Product
         WHERE maker NOT IN (SELECT maker 
                               FROM Product 
                              WHERE type = 'Laptop')) AS x
      INNER JOIN (SELECT maker, COUNT(model) AS all_count 
                    FROM Product 
                   GROUP BY maker) AS y 
      ON x.maker = y.maker
