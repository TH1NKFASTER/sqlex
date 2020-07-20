SELECT name 
  FROM Ships
 WHERE name SIMILAR TO 'R%'

UNION

SELECT ship AS name
  FROM Outcomes
 WHERE ship SIMILAR TO 'R%'
