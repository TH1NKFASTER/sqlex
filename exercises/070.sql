SELECT DISTINCT battle
  FROM (SELECT country, ship, battle
          FROM outcomes
                   INNER JOIN classes
                   ON classes.class = outcomes.ship

         UNION

        SELECT country, ship, battle
          FROM (SELECT *
                  FROM outcomes
                           INNER JOIN ships
                           ON outcomes.ship = ships.name) AS x
                   INNER JOIN classes
                   ON classes.class = x.class) AS z
 GROUP BY z.country, z.battle
HAVING COUNT(ship) >= 3
