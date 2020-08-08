WITH q AS (SELECT ROW_NUMBER() OVER (ORDER BY code) AS line, code, price FROM pc ORDER BY line),
       t AS (SELECT first.code AS code, COUNT(second.code) AS cnt, AVG(second.price) AS result
               FROM q AS first
                        INNER JOIN q AS second
                        ON second.line - first.line BETWEEN 0 AND 5
              GROUP BY first.code)
SELECT code, result
  FROM t
 WHERE cnt = 6
