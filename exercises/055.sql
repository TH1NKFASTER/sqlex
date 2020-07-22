SELECT y.class, x.m 
  FROM (SELECT Ships.class AS class, MIN(launched) AS m
          FROM Ships 
         GROUP BY Ships.class) AS x
      RIGHT JOIN (SELECT class, NULL AS m 
                    FROM Classes) AS y 
      ON y.class = x.class
