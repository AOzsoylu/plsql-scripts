SELECT address, to_char(hash_value,'999999999999') "Hash Value",
       disk_reads, executions, disk_reads/executions "Reads/Exec",
       sql_text
FROM v$sqlarea
  WHERE disk_reads > 100000 and executions>0
  ORDER BY 3
/
