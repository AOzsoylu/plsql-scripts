set pagesize 1000
-- set echo on
column rbs format a25
column oracle_user format a20 heading "Oracle|Username"
column sid format 99999 heading "Oracle|SID"
column serial# format 999999 heading "Oracle|Serial#"
column unix_pid format a7 Heading "Unix|PID"
column Client_User format a20 Heading "Client OS|Username"
select p.spid                  unix_pid,
       s.sid                   sid,
       s.serial#               serial#,
       r.name                  rbs,
       nvl(s.username, 'None') oracle_user,
       s.terminal,
       s.osuser                client_user,
       s.last_call_et "Idle seconds",
       s.program
from v$process p, v$rollname r, v$session s, v$transaction t
where s.taddr=t.addr
and  s.paddr = p.addr(+)
and  r.usn=t.xidusn(+)
order by r.name, nvl(s.username, 'None'), s.osuser
/
