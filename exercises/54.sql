SELECT ROUND(AVG(numGuns * 1.0), 2) 
  FROM (SELECT numGuns 
          FROM Classes 
              INNER JOIN Ships 
              ON Ships.class = Classes.class 
         WHERE type = 'bb'

UNION ALL

SELECT numGuns 
  FROM Classes 
      INNER JOIN Outcomes 
      ON class = ship 
 WHERE ship NOT IN (SELECT name 
                      FROM Ships) 
       AND type = 'bb') AS x
