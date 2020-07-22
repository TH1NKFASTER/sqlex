SELECT x.date, COUNT(trip_no)
  FROM (SELECT generate_series(to_timestamp('01/04/2003', 'DD/MM/YYYY'),
to_timestamp('07/04/2003', 'DD/MM/YYYY'), '1 day')::TIMESTAMP AS date) AS x
      LEFT JOIN (SELECT DISTINCT Trip.trip_no, date 
                   FROM Trip, Pass_in_trip
                  WHERE Pass_in_trip.trip_no = Trip.trip_no 
                        AND town_from = 'Rostov') AS y 
      ON x.date = y.date
 GROUP BY x.date
