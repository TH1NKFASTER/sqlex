SELECT name 
  FROM (SELECT DISTINCT ID_psg 
          FROM Pass_in_trip
         GROUP BY ID_psg, place
        HAVING COUNT(trip_no) > 1) AS x 
      INNER JOIN Passenger 
      ON Passenger.ID_psg = x.ID_psg
