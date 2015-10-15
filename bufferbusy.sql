select
   sess.username,
   sess.sid,
   se.event,
   se.total_waits,
   se.total_timeouts,
   se.time_waited/100 time_waited,
   se.average_wait
from v$session_event se, v$session sess
where se.event like '%buffer busy%'
  and sess.sid = se.sid
  and sess.username is not null
  and se.total_waits > 10000
order by username, sid
/
