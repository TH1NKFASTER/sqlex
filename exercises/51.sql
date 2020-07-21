SELECT name
  FROM (SELECT name, displacement, numGuns
          FROM Classes
              INNER JOIN Ships
              ON Ships.class = Classes.class

        UNION

        SELECT class AS name, displacement, numGuns
          FROM Classes
              INNER JOIN Outcomes
              ON Classes.class = Outcomes.ship) AS x
      INNER JOIN (SELECT displacement, MAX(numGuns) AS m
                    FROM (SELECT name, displacement, numGuns
                            FROM Classes 
                                INNER JOIN Ships 
                                ON Ships.class = Classes.class

                          UNION

                          SELECT class AS name, displacement, numGuns 
                            FROM Classes 
                                INNER JOIN Outcomes 
                                ON Classes.class = Outcomes.ship) AS y 
                   GROUP BY displacement) AS t 
      ON t.displacement = x.displacement
 WHERE m = numGuns
