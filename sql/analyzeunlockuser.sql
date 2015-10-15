select table_name, 'EXEC DBMS_STATS.UNLOCK_TABLE_STATS(OWNNAME=>'''||Upper('&1')||''', TABNAME=>'''||table_name||''')' as script
from dba_tables where owner = Upper('&1')
order by table_name
/
