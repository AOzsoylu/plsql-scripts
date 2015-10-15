SELECT a.sid, c.sql_text "sql script"
  FROM v$session a, v$sqltext c
  WHERE a.sql_address    = c.address
    AND a.sql_hash_value = c.hash_value
    and c.hash_value = '&hash'
  ORDER BY c.piece
/
