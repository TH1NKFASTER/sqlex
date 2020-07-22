SELECT COUNT(*) 
  FROM (SELECT COALESCE(x.town_from, y.town_from) AS town_from,
        COALESCE(x.town_to, y.town_from), (COALESCE(cnt1, 0) + COALESCE(cnt2, 0)) AS result 
          FROM (SELECT town_from, town_to, COUNT(trip_no) AS cnt1
                  FROM Trip
                 WHERE town_from < town_to
                 GROUP BY town_from, town_to) AS x
              FULL JOIN (SELECT town_from, town_to, COUNT(trip_no) AS cnt2
                           FROM Trip
                          WHERE town_from > town_to
                          GROUP BY town_from, town_to) AS y
              ON x.town_to = y.town_from 
                 AND x.town_from = y.town_to) AS z
 WHERE result = (SELECT MAX(result) 
                   FROM (SELECT COALESCE(x.town_from, y.town_from) AS town_from, COALESCE(x.town_to, y.town_from),
                        (COALESCE(cnt1, 0) + COALESCE(cnt2, 0)) AS result 
                           FROM (SELECT town_from, town_to, COUNT(trip_no) AS cnt1
                                   FROM Trip
                                  WHERE town_from < town_to
                                  GROUP BY town_from, town_to) AS x
                                       FULL JOIN (SELECT town_from, town_to, COUNT(trip_no) AS cnt2
                                                    FROM Trip
                                                   WHERE town_from > town_to
                                                   GROUP BY town_from, town_to) AS y
                                       ON x.town_to = y.town_from 
                                          AND x.town_from = y.town_to) AS h)
