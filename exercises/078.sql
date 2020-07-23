SELECT name, date_trunc('month', date)::date AS firstd,
       (date_trunc('month', date + '1 month') - INTERVAL '1 day')::date AS lastd
  FROM battles
