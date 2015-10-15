select p.spid as "O/S|PID", Substr(d.name,1,5) as "Dispatcher|Name",
       substr(d.network,1,50) as "Dispatcher|Network",
       d.status
from v$process p, v$dispatcher d
where d.paddr = p.addr(+)
/
