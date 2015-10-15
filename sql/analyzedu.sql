select table_name, to_char(last_analyzed,'dd/mm/yyyy hh24:mi:ss') tarih,
    'exec dbms_stats.gather_table_stats(ownname=>'''||owner||''',tabname=>'''||
     table_name||''', degree=>8, cascade=>true)' as analyze
from dba_tables
where owner=Upper('&owner')
  and last_analyzed is not null
order by last_analyzed
/
