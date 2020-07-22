  WITH good_outcomes AS (SELECT point, date, SUM(out) AS total_out FROM outcome GROUP BY point, date),
       good_incomes AS (SELECT point, date, SUM(inc) AS total_inc FROM income GROUP BY point, date)


SELECT point, TO_CHAR(date, 'dd/mm/yyyy'), SUM(result) OVER (PARTITION BY point ORDER BY date)
  FROM (SELECT COALESCE(good_incomes.point, good_outcomes.point) AS point,
               COALESCE(good_incomes.date, good_outcomes.date) AS date,
               (COALESCE(good_incomes.total_inc, 0) - COALESCE(good_outcomes.total_out, 0)) AS result
          FROM good_outcomes
                   FULL JOIN good_incomes
                   ON good_incomes.point = good_outcomes.point AND good_incomes.date = good_outcomes.date
         ORDER BY COALESCE(good_incomes.date, good_outcomes.date)) AS x
