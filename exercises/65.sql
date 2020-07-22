SELECT ROW_NUMBER() OVER (ORDER BY maker, sorting),
CASE
WHEN type = 'PC' THEN maker
WHEN type = 'Laptop' AND maker NOT IN (SELECT maker
                                             FROM Product
                                            WHERE type = 'PC') THEN maker
WHEN type = 'Printer' AND maker NOT IN (SELECT maker 
                                          FROM Product 
                                         WHERE type != 'Printer') THEN maker
ELSE NULL
END AS maker, type 
  FROM (SELECT DISTINCT maker, type,
        CASE type
        WHEN 'PC' THEN 1
        WHEN 'Laptop' THEN 2
        ELSE 3
        END AS sorting 
          FROM Product) AS x
