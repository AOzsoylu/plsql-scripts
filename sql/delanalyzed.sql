select 'analyze table '||table_name||' delete statistics;'
from dba_tables
where owner = UPPER('&username')
  and last_analyzed is not null
order by last_analyzed desc
/
