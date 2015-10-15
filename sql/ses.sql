SELECT
  Substr(s.server,1,1) as server,
  p.spid OS_pid,
  s.sid,
  s.serial#,
  s.status,
  Substr(s.username,1,10) "Username",
  s.terminal,
  s.osuser,
  s.last_call_et "Idle seconds",
  s.program "Program"
FROM v$process p, v$session s
WHERE s.paddr   = p.addr(+)
  AND s.username is not null
ORDER BY s.username, s.terminal
/
