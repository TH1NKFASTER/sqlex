SELECT COUNT(*) 
  FROM(SELECT town_from, town_to, COUNT(trip_no) 
         FROM Trip
        GROUP BY town_from, town_to
       HAVING COUNT(trip_no) = (SELECT MAX(cnt) 
                                  FROM (SELECT COUNT(trip_no) AS cnt 
                                          FROM Trip
                                         GROUP BY town_from, town_to) AS x)) AS t
