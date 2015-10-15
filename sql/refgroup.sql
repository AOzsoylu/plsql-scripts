select Substr(rowner||'.'||rname,1,30) as name,
       DECODE(broken,'N','NO    ','YES   ') as broken,
       To_Char(next_date,'dd-mm-yyyy hh24:mi:ss') as next,
       interval
from dba_refresh order by 1
/
