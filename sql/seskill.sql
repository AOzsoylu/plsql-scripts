SELECT
  'kill -9 '||p.spid unix_pid,
  s.sid,
  s.serial#,
  s.status,
  Substr(s.username,1,10) "Username",
  s.terminal,
  s.osuser,
  s.program "Program"
FROM v$process p, v$session s
WHERE s.paddr   = p.addr(+)
ORDER BY s.username, s.terminal
/
