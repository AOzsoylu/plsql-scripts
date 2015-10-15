select 'alter system kill session '''||a.sid||','||a.serial#||''';'
from v$session a, dba_blockers b
where a.sid = b.holding_session
/
