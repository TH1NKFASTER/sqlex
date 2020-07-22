SELECT DISTINCT name
  FROM Battles
 WHERE EXTRACT(YEAR FROM date) NOT IN (SELECT launched 
                                         FROM Ships
                                        WHERE launched IS NOT NULL)
