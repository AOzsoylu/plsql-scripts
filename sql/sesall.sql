SELECT
  Substr(s.server,1,1) as server,
  p.spid unix_pid,
  s.sid,
  s.serial#,
  s.status,
  Substr(s.username,1,15) "Username",
  s.terminal,
  s.osuser,
  s.last_call_et "Idle seconds",
  s.program "Program"
FROM v$process p, v$session s
WHERE s.paddr   = p.addr(+)
ORDER BY s.username, s.terminal
/
