SELECT
  p.spid unix_pid,
  s.sid,
  s.serial#,
  s.status,
  Substr(s.username,1,10) "Username",
  s.terminal,
  s.osuser,
  s.program
FROM v$process p, v$session s
WHERE s.paddr   = p.addr(+)
  and p.spid in ( &pidlist )
ORDER BY s.username, s.terminal
/
