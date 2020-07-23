SELECT name, z.cnt
  FROM (SELECT max(cnt) AS cnt
          FROM (SELECT passenger.id_psg, COUNT(trip_no) AS cnt
                  FROM passenger,
                       pass_in_trip
                 WHERE passenger.id_psg IN (SELECT pass_in_trip.id_psg
                                              FROM trip,
                                                   pass_in_trip
                                             WHERE trip.trip_no = pass_in_trip.trip_no
                                             GROUP BY pass_in_trip.id_psg
                                            HAVING COUNT(DISTINCT trip.id_comp) = 1)
                   AND pass_in_trip.id_psg = passenger.id_psg
                 GROUP BY passenger.id_psg) AS y) AS z,
       (SELECT passenger.name, passenger.id_psg, COUNT(trip_no) AS cnt
          FROM passenger,
               pass_in_trip
         WHERE passenger.id_psg IN (SELECT pass_in_trip.id_psg
                                      FROM trip,
                                           pass_in_trip
                                     WHERE trip.trip_no = pass_in_trip.trip_no
                                     GROUP BY pass_in_trip.id_psg
                                    HAVING COUNT(DISTINCT trip.id_comp) = 1)
           AND pass_in_trip.id_psg = passenger.id_psg
         GROUP BY passenger.id_psg, passenger.name) AS t
 WHERE t.cnt = z.cnt
