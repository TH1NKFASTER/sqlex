SELECT country, class
  FROM classes
 WHERE country SIMILAR TO (CASE WHEN 'Russia' IN (SELECT country FROM classes) THEN 'Russia' ELSE '%' END)
