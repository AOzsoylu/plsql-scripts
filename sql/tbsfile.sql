select a.bytes/(1024*1024) as bytes, Substr(b.name,1,30) as tbsname, a.name as filename
from v$datafile a, v$tablespace b
where a.ts# = b.ts#
  and b.name like Upper('&tbsname%')
/
