select incarnation#, resetlogs_change#, resetlogs_time, resetlogs_id                            
from v$database_incarnation
order by 1
/
