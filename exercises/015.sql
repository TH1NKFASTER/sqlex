SELECT hd
  FROM (SELECT hd, COUNT(hd) AS cnt
          FROM PC
         GROUP BY hd) AS t
 WHERE cnt > 1
