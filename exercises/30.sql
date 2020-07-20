SELECT COALESCE(a.point, b.point) AS point, COALESCE(a.date, b.date) AS date, totalOutcome, totalIncome
  FROM(SELECT point, date, SUM(inc) AS totalIncome
         FROM Income
        GROUP BY point, date) AS a
      FULL JOIN (SELECT point, date, SUM(out) AS totalOutcome
                   FROM OUTCOME
                  GROUP BY point, date) AS b
      ON a.date = b.date
      AND a.point = b.point
