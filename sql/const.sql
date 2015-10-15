SELECT c.status, c.owner, c.table_name, c.constraint_name
  FROM user_constraints c, user_tables t
WHERE c.table_name = t.table_name
ORDER BY c.constraint_type DESC
/
