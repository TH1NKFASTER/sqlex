SELECT country, name AS battle
  FROM classes,
       battles EXCEPT
SELECT classes.country AS country, outcomes.battle AS battle
  FROM classes,
       outcomes,
       ships
 WHERE classes.class = outcomes.ship
    OR classes.class = ships.class AND ships.name = outcomes.ship
