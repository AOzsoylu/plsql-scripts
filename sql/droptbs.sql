select 'drop tablespace '||tablespace_name||' including contents and datafiles cascade constraints;'
from dba_tablespaces where tablespace_name like Upper('%&tbs%')
order by tablespace_name
/
