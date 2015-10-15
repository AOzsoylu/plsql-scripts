select * from (
SELECT b.sid
       ,b.serial#
       ,c.spid
       ,Substr(b.machine,1,25)
       ,b.username
       ,b.osuser
       ,a.value
--       ,e.sql_text "sql script"
FROM v$sesstat a, v$session b, v$process c, v$statname d--, v$sqltext e
WHERE a.sid = b.sid
  AND b.paddr = c.addr
  AND a.statistic# = d.statistic#
  AND d.name = 'CPU used by this session'
--  AND b.sql_address = e.address
--  AND b.sql_hash_value = e.hash_value
ORDER BY a.value desc )
where rownum <= 30
/
