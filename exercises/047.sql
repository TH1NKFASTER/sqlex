SELECT y.country 
  FROM (SELECT country, COUNT(*) AS cnt 
          FROM (SELECT ship, country
                  FROM Outcomes 
                      INNER JOIN Classes
                      ON Classes.class = Outcomes.ship
                      
                UNION
                 
                SELECT name AS ship, country 
                  FROM Ships 
                      INNER JOIN Classes 
                      ON Classes.class = Ships.class) AS x
         GROUP BY country) AS y
              INNER JOIN (SELECT country, COUNT(*) AS sunk 
                            FROM (SELECT ship, country 
                                    FROM Outcomes 
                                        INNER JOIN Classes 
                                        ON Classes.class = Outcomes.ship
                                        
                                  UNION
                                  
                                  SELECT name AS ship, country 
                                    FROM Ships 
                                        INNER JOIN Classes 
                                        ON Classes.class = Ships.class) AS x
                                LEFT JOIN Outcomes 
                                ON x.ship = Outcomes.ship
                           WHERE result = 'sunk'
                           GROUP BY country) AS z
              ON y.country = z.country
 WHERE cnt = sunk
