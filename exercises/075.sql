  WITH makers_from_pc AS (SELECT maker
                            FROM pc
                                     NATURAL JOIN product),
       makers_from_laptop AS (SELECT maker
                                FROM laptop
                                         NATURAL JOIN product),
       makers_from_printer AS (SELECT maker
                                 FROM printer
                                          INNER JOIN product
                                          ON product.model = printer.model),
       answer_for_pc AS (SELECT maker, MAX(price) AS price
                           FROM pc
                                    NATURAL JOIN product
                          GROUP BY maker
                          UNION
                         SELECT maker, NULL AS price
                           FROM makers_from_laptop
                          WHERE maker NOT IN (SELECT * FROM makers_from_pc)
                          UNION
                         SELECT maker, NULL AS price
                           FROM makers_from_printer
                          WHERE maker NOT IN (SELECT * FROM makers_from_pc)),
       answer_for_laptop AS (SELECT maker, MAX(price) AS price
                               FROM laptop
                                        NATURAL JOIN product
                              GROUP BY maker

                              UNION
                             SELECT maker, NULL AS price
                               FROM makers_from_pc
                              WHERE maker NOT IN (SELECT * FROM makers_from_laptop)

                              UNION
                             SELECT maker, NULL AS price
                               FROM makers_from_printer
                              WHERE maker NOT IN (SELECT * FROM makers_from_laptop)),
       answer_for_printer AS (SELECT maker, MAX(price) AS price
                                FROM printer
                                         INNER JOIN product
                                         ON product.model = printer.model
                               GROUP BY maker

                               UNION
                              SELECT maker, NULL AS price
                                FROM makers_from_pc
                               WHERE maker NOT IN (SELECT * FROM makers_from_printer)

                               UNION
                              SELECT maker, NULL AS price
                                FROM makers_from_laptop
                               WHERE maker NOT IN (SELECT * FROM makers_from_printer))

SELECT DISTINCT answer_for_laptop.maker, answer_for_laptop.price AS laptop, answer_for_pc.price AS pc,
                answer_for_printer.price AS printer
  FROM answer_for_pc,
       answer_for_laptop,
       answer_for_printer
 WHERE answer_for_printer.maker = answer_for_laptop.maker
   AND answer_for_pc.maker = answer_for_laptop.maker
   AND (answer_for_laptop.price IS NOT NULL OR answer_for_pc.price IS NOT NULL OR answer_for_printer.price IS NOT NULL) 
