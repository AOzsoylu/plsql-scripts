SELECT * FROM (
SELECT
  ROUND((v.value/t.value)*100,2) as yuzde,
  p.spid unix_pid,
  s.sid,
  s.serial#,
  s.status,
  Substr(s.username,1,10) as username,
  s.terminal,
  s.osuser,
  Substr(DECODE(sfprogramadi(s.sid, s.serial#),NULL,s.program,'OPSIS-'||sfprogramadi(s.sid, s.serial#)),1,48) as program
FROM v$process p, v$session s, v$sesstat v,
     (SELECT value FROM v$sysstat WHERE name = 'CPU used by this session') t
WHERE s.paddr   = p.addr(+)
  AND s.username is not null
  AND s.sid = v.sid
  AND v.statistic# = 12 )
ORDER BY yuzde DESC, username, terminal
/
