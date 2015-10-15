select a.group_number,
       a.name as groupname,
       b.disk_number,
       b.name as diskname,
       Substr(b.path,1,50) as path,
       b.total_mb
from v$asm_diskgroup a, v$asm_disk b
where a.group_number(+) = b.group_number
  and a.name = Upper('&1')
order by a.group_number, a.name, b.name, b.path
/
