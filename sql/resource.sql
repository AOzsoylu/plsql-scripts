SELECT
  Substr(s.server,1,1) as server,
  p.spid OS_pid,
  s.sid,
  s.serial#,
  s.status,
  Substr(s.username,1,10) "Username",
  s.terminal,
  s.osuser,
  t.deger,
  s.program "Program"
FROM v$process p, v$session s,
     (select sid, deger from
         (select sid, sum(value) as deger from v$sesstat
          where statistic# in (224,223,12,115,9,20,15)
          group by sid order by 2 desc )
      WHERE rownum <= 20) t
WHERE s.paddr   = p.addr(+)
  AND s.username is not null
  AND s.sid = t.sid
ORDER BY t.deger desc,s.username, s.terminal
/
