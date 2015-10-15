select 'CREATE BIGFILE TABLESPACE '||rpad(b.name,30,' ')||' DATAFILE ''+DATA'' SIZE '||ceil(a.bytes/(1024*1024)/100)*100||'M AUTOEXTEND ON MAXSIZE UNLIMITED;'
from v$datafile a, v$tablespace b
where a.ts# = b.ts#
  and b.name not in ('SYSTEM','SYSAUX','UNDOTBS','UNDOTBS1','UNDOTBS2')
order by b.name, a.name
/
