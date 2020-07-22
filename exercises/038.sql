SELECT DISTINCT a.country
  FROM Classes a, Classes b
 WHERE a.type = 'bb'
       AND b.type = 'bc'
       AND a.country = b.country
