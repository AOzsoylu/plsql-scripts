select sid, total_waits, time_waited
from v$session_event
where event = 'db file sequential read'
  and total_waits > 0
order by 3,2
/
