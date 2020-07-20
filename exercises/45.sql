SELECT name 
  FROM Ships
 WHERE name SIMILAR TO '% % %'

UNION

SELECT ship AS name
  FROM Outcomes
 WHERE ship SIMILAR TO '% % %'
