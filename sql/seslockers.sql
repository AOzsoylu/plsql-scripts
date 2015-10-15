SELECT
  p.spid unix_pid,
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
  and s.sid in ( select sid from v$lock where block=1 union all select sid from v$lock where request > 0 )
ORDER BY s.username, s.terminal
/
