SELECT b.tablespace,
       sum(ROUND(((b.blocks*p.value)/1024/1024),2))||'M' "SIZE",
       count(*),
       a.username,
       a.osuser,
       a.program,
       a.terminal 
FROM sys.v_$session a,
     sys.v_$sort_usage b,
     sys.v_$parameter p
  WHERE p.name  = 'db_block_size'
    AND a.saddr = b.session_addr
GROUP BY b.tablespace, a.username, a.osuser, a.program, a.terminal
ORDER BY sum(ROUND(((b.blocks*p.value)/1024/1024),2)), b.tablespace, a.username, a.osuser, a.program
/
