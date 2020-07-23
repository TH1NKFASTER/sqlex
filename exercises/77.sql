  WITH result AS (SELECT MAX(cnt)
                    FROM (SELECT count(DISTINCT trip_no) AS cnt
                            FROM trip
                                     NATURAL JOIN pass_in_trip
                           WHERE town_from = 'Rostov'
                           GROUP BY date) AS x)

SELECT count(DISTINCT trip_no) AS cnt, date AS cnt
  FROM trip
           NATURAL JOIN pass_in_trip
 WHERE town_from = 'Rostov'
 GROUP BY date
HAVING count(DISTINCT trip_no) = (SELECT * FROM result)
