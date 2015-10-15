select 'exec dbms_stats.gather_table_stats(ownname=>NULL,tabname=>'''||table_name||''',cascade=>TRUE)' as calistir
from user_tables
where last_analyzed is not null
order by last_analyzed desc
/
