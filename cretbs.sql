select 'CREATE TABLESPACE '||b.name||' DATAFILE '''||a.name||''' SIZE '||ceil(a.bytes/(1024*1024)/100)*100||'M;'
from v$datafile a, v$tablespace b
where a.ts# = b.ts#
  and b.name like Upper('&tbsname%')
order by b.name, a.name
/
