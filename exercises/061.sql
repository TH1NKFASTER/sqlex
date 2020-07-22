SELECT SUM(COALESCE(plus + minus, plus, minus)) AS result 
  FROM(SELECT point, SUM(inc) AS plus 
         FROM Income_o
        GROUP BY point) AS x
      FULL JOIN (SELECT point, -SUM(out) AS minus 
                   FROM Outcome_o 
                  GROUP BY point) AS y 
      ON x.point = y.point
