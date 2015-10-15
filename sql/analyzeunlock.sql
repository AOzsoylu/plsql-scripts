select tname,
       'EXEC DBMS_STATS.UNLOCK_TABLE_STATS(OWNNAME=>NULL, TABNAME=>'''||tname||''')' as script
from tab
where tabtype = 'TABLE'
  and tname like Upper('&tabname%')
order by tname
/
