SELECT COALESCE(i.point, o.point) AS point, COALESCE(i.date, o.date) AS date, inc, out
  FROM Income_o AS i
      FULL JOIN Outcome_o AS o
      ON  i.point = o.point
      AND i.date = o.date
