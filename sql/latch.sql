select
   s.sid
   , s.username username
   , e.event event
   , e.wait_time
   , e.state
   , e.p1
   , e.p2
from v$session s, v$session_wait e
where s.username is not null
  and s.sid = e.sid
order by s.sid, s.username, e.seq#
/
