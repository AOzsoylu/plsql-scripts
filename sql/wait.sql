select OSUSER, SUBSTR(event,1,30),WAIT_TIME,SECONDS_IN_WAIT,
  SUBSTR(sql_text,1,100)
 from v$session ses, v$sql sql, v$session_wait ses_w, v$sess_io sio
 where ses.sid=ses_w.sid(+) and ses.sql_hash_value=sql.hash_value(+)
   and ses.sql_address=sql.address(+) and sio.sid(+)=ses.sid
   and ses.type != 'BACKGROUND' AND EVENT NOT LIKE 'SQL%' order by OSUSER
/
