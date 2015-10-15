SELECT
  p.spid unix_pid,
  s.sid,
  s.serial#,
  s.status,
  Substr(s.username,1,15) "Username",
  s.terminal,
  s.osuser,
  s.program "Program"
FROM v$process p, v$session s
WHERE s.paddr   = p.addr(+)
  AND s.username is not null
  AND s.username like Upper('&1%')
ORDER BY s.username, s.terminal
/
