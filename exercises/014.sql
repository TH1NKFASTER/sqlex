SELECT Classes.class AS class, Ships.name AS name, Classes.country AS country
  FROM Classes
      INNER JOIN Ships
      ON Classes.class = Ships.class
 WHERE Classes.numGuns >= 10
