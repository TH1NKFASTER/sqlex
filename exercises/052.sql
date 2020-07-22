SELECT name
  FROM (SELECT name, type, country, bore, displacement, numGuns
          FROM Classes
              INNER JOIN Ships
              ON Classes.class = Ships.class) AS x
 WHERE (type = 'bb'
        OR type IS NULL)
       AND (bore < 19
            OR bore IS NULL)
       AND (country = 'Japan'
            OR country IS NULL)
       AND (displacement <= 65000
            OR displacement IS NULL)
       AND (numGuns >= 9
            OR numGuns IS NULL)
