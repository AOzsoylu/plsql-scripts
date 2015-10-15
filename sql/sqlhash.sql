SELECT sql_text "sql script"
  FROM v$sqltext
  WHERE hash_value = &hash
  ORDER BY piece
/
