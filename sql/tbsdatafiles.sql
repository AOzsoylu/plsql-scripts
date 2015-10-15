select a.bytes/(1024*1024) as "bytes", RPAD(a.name,60,' ')||b.name as "datafile/tablespace", a.creation_time
from v$datafile a, v$tablespace b
where a.ts# = b.ts#
  and b.name like Upper('&tbsname%')
order by 2
/
