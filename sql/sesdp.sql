SELECT
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
  and (s.sid, s.serial#) in ( select sid, serial# from v$session s, dba_datapump_sessions d where s.saddr = d.saddr )
ORDER BY s.username, s.terminal
/
