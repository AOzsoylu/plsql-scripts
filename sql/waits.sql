select count(*) as sayi, event
from v$session_wait
where wait_time = 0
  and event not in ('smon timer','pmon timer','SQL*Net message from client',
                    'rdbms ipc message')
group by event
order by 1 desc
/
