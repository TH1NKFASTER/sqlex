SELECT COALESCE(x.point, y.point) AS point, COALESCE(x.date, y.date) AS date,
CASE
WHEN total_inc IS NULL THEN 'out'
ELSE 'inc'
END AS operation, COALESCE(total_inc, total_out) AS money
  FROM (SELECT point, date, SUM(inc) AS total_inc
          FROM Income
         GROUP BY point, date) AS x
      FULL JOIN (SELECT point, date, SUM(out) AS total_out 
                   FROM Outcome
                  GROUP BY point, date) AS y
      ON x.point = y.point AND x.date = y.date
 WHERE x.point IS NULL or y.point IS NULL
