SELECT avg(speed) as averageSpeed
  FROM (SELECT *
          FROM Product
              INNER JOIN PC
              ON PC.model = Product.model) AS ProductPC
 WHERE ProductPC.maker = 'A'
