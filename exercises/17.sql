SELECT DISTINCT 'Laptop' AS type, model, speed 
  FROM Laptop 
 WHERE speed < ALL(SELECT DISTINCT speed 
                     FROM PC)
