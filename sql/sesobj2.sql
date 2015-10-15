SELECT
  p.spid  unix_pid,
  s.sid,
  s.serial#,
  s.status,
  Substr(s.username,1,10) username,
  s.terminal,
  s.osuser
from v$process p, v$session s, v$access a
WHERE s.paddr = p.addr(+)
  AND s.username is not null
  AND s.sid = a.sid
  AND a.object = Upper('&objname')
ORDER BY s.username, s.terminal
/
