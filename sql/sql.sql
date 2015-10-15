SELECT c.sql_text "sql script"
  FROM v$session a, v$sqltext c
  WHERE a.sid            = &sid
    AND a.sql_address    = c.address
    AND a.sql_hash_value = c.hash_value
  ORDER BY c.piece
/
