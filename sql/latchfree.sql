select w.sid, n.name, Sum(w.p3) sleeps, Sum(w.seconds_in_wait) secs
from v$session_wait w, v$latchname n
where w.event = 'latch free'
  and w.p2 = n.latch#
group by w.sid, n.name
/
