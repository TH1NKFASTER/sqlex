  WITH q AS (SELECT EXTRACT(MONTH FROM date) AS month, EXTRACT(YEAR FROM date) AS year, SUM(out) AS total
               FROM outcome
              GROUP BY month, year
              ORDER BY total DESC),
       p AS (SELECT * FROM q WHERE total >= ALL (SELECT total FROM q))
SELECT outcome.code, outcome.point, outcome.date, outcome.out
  FROM outcome
           INNER JOIN p
           ON p.month = EXTRACT(MONTH FROM date) AND p.year = EXTRACT(YEAR FROM date)
