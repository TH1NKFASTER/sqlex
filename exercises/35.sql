SELECT model, type
  FROM Product 
 WHERE model SIMILAR TO '[0-9]*'
       OR model SIMILAR TO '([a-z]|[A-Z])*'
