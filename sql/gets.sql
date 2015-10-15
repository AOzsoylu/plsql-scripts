select
  ses.sid, ses.serial#, ses.terminal, executions, buffer_gets,
  disk_reads, block_gets, consistent_gets,physical_reads,
  username, event, 
  Substr(sql_text,1,200)
from
   v$session ses,
   v$sql sql,
   v$session_wait ses_w,
   v$sess_io sio
where ses.sid=ses_w.sid(+)
  and ses.sql_hash_value=sql.hash_value(+)
  and ses.sql_address=sql.address(+)
  and sio.sid(+)=ses.sid
  and ses.type != 'BACKGROUND'
order by buffer_gets+disk_reads desc, username
/
