select e.sid
      ,e.event
      ,e.time_waited
      ,e.time_waited_micro
from v$session_event e, v$session s
where e.sid=s.sid
  and s.program like '%LGWR%'
order by 3
/
