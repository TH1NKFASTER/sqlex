SELECT model
  FROM PC
 WHERE price = (SELECT MAX(price) AS t
                  FROM (SELECT model, price
                          FROM Laptop

                        UNION

                        SELECT model, price
                          FROM PC

                        UNION

                        SELECT model, price
                          FROM printer) AS x)

UNION

SELECT model
  FROM Laptop
 WHERE price = (SELECT MAX(price) AS t
                  FROM (SELECT model, price
                          FROM Laptop

                        UNION

                        SELECT model, price
                          FROM PC

                        UNION

                        SELECT model, price
                          FROM printer) AS x)

UNION

SELECT model
  FROM Printer
 WHERE price = (SELECT MAX(price) AS t
                  FROM (SELECT model, price
                          FROM Laptop

                        UNION

                        SELECT model, price
                          FROM PC

                        UNION

                        SELECT model, price
                          FROM printer) AS x)
