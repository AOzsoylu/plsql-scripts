select 'CREATE TABLESPACE '||rpad(name,30,' ')||' DATAFILE ''/oradata/'||'<SID>'||'/'||Lower(name)||'01.dbf'' SIZE 100M AUTOEXTEND ON MAXSIZE 32000M;'
from v$tablespace b
where name not in ('SYSTEM','SYSAUX','UNDOTBS','UNDOTBS1','UNDOTBS2','UNDO')
order by name
/
