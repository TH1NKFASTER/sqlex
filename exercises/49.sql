SELECT name FROM Ships, Classes
WHERE Ships.class = Classes.class
      AND bore = 16

UNION

SELECT ship AS name FROM Outcomes, Classes
WHERE ship = class 
      AND bore = 16
