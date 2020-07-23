  WITH time_in_trips AS (SELECT id_psg,
                                SUM(CASE WHEN time_in::timestamp <= time_out::timestamp
                                             THEN time_in::timestamp - time_out::timestamp + INTERVAL '24 hours'
                                         ELSE time_in::timestamp - time_out::timestamp END) AS res
                           FROM pass_in_trip
                                    NATURAL JOIN trip
                          GROUP BY id_psg),
       res AS (SELECT MAX(res) FROM time_in_trips)
  
SELECT name, extract(MINS FROM res) + 60 * extract(HOURS FROM res) AS time
  FROM time_in_trips,
       passenger
 WHERE res = (SELECT * FROM res)
   AND passenger.id_psg = time_in_trips.id_psg
