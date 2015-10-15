SELECT
  p.spid OS_pid,
  s.sid,
  s.serial#,
  s.status,
  Substr(s.username,1,10) "Username",
  s.terminal,
  s.osuser,
--  To_Char(s.logon_time,'dd-mm-yyyy hh24:mi:ss') "Logon Time",
  s.program "Program"
FROM v$process p, v$session s
WHERE s.paddr = p.addr(+)
  AND s.status = 'ACTIVE'
  AND s.username is not null
ORDER BY s.username, s.terminal
/
