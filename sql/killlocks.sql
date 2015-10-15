select 'alter system kill session '''||a.sid||','||a.serial#||''';'
from v$session a
where a.sid in ( select session_id from v$locked_object )
  and a.lockwait != 'ACTIVE'
/
