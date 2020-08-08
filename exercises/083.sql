SELECT name
  FROM ships
           INNER JOIN classes
           ON ships.class = classes.class
 WHERE ships.class = classes.class
   AND (CASE WHEN numguns = 8 THEN 1 ELSE 0 END + CASE WHEN bore = 15 THEN 1 ELSE 0 END +
        CASE WHEN displacement = 32000 THEN 1 ELSE 0 END + CASE WHEN type = 'bb' THEN 1 ELSE 0 END +
        CASE WHEN launched = 1915 THEN 1 ELSE 0 END + CASE WHEN ships.class = 'Kongo' THEN 1 ELSE 0 END +
        CASE WHEN country = 'USA' THEN 1 ELSE 0 END) >= 4
