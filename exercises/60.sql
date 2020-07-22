SELECT x.point AS point, COALESCE(plus - minus, plus, -minus) AS result 
  FROM (SELECT point, SUM(inc) AS plus 
          FROM Income_o
         WHERE date < to_timestamp('15 04 2001', 'DD MM YYYY') 
         GROUP BY point) AS x
      LEFT JOIN (SELECT point, SUM(out) AS minus 
                   FROM Outcome_o
                  WHERE date < to_timestamp('15 04 2001', 'DD MM YYYY') 
                  GROUP BY point) AS y
      ON x.point = y.point
