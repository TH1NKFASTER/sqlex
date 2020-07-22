SELECT DISTINCT name FROM Classes, Ships
 WHERE Ships.Class = Classes.class
       AND launched >= 1922
       AND displacement > 35000
       AND type = 'bb'
