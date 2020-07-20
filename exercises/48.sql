SELECT class
  FROM Classes
 WHERE class IN (SELECT ship
                  FROM Outcomes
                 WHERE result = 'sunk')

                UNION

                SELECT class
                  FROM Classes
                 WHERE class IN (SELECT class 
                                   FROM Ships
                                       INNER JOIN Outcomes 
                                       ON Ships.name = Outcomes.ship
                                  WHERE result = 'sunk')
