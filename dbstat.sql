select a.open_mode, b.logins, Substr(a.name,1,10) as dbname,
       log_mode
from v$database a, v$instance b
/
