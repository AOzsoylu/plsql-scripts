select a.username, a.sid, b.event, b.seq#, b.seconds_in_wait, b.wait_time,
       b.p1, b.p2, b.p3, b.state
from v$session a, v$session_wait b
where a.sid = b.sid
  and b.event not like 'SQL%'
  and b.event not like '%timer%'
  and b.event not like '%message%'
  and b.event not like '%pipe get%'
  and b.event not like 'jobq slave wait%'
  and b.event not like 'null event%'
  and b.event not like 'wakeup time%'
/
