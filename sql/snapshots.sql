select To_Char(start_with,'DD-MM-YYYY HH24:MI:SS')||' '||
       RPAD(LTRIM(RTRIM(next)),30,' ')||
       refresh_mode||'  '||RPAD(status,10,' ')||
       RPAD(owner||'.'||name,30,' ')||
       master_owner||'.'||master||master_link as snapshot
from dba_snapshots
/
