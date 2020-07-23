  WITH passengers_diff_places AS (SELECT id_psg
                                    FROM pass_in_trip
                                   GROUP BY id_psg
                                  HAVING COUNT(DISTINCT place) = COUNT(place)),
       time_in_trips AS (SELECT id_psg,
                                SUM(CASE WHEN time_in::timestamp <= time_out::timestamp
                                             THEN time_in::timestamp - time_out::timestamp + INTERVAL '24 hours'
                                         ELSE time_in::timestamp - time_out::timestamp END) AS res
                           FROM pass_in_trip
                                    NATURAL JOIN trip
                          GROUP BY id_psg)
  
SELECT name, extract(MIN FROM res) + 60 * extract(HOURS FROM res) AS minutes
  FROM time_in_trips,
       passenger,
       passengers_diff_places
 WHERE passengers_diff_places.id_psg = passenger.id_psg
   AND time_in_trips.id_psg = passengers_diff_places.id_psg
