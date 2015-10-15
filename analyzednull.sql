select table_name, to_char(last_analyzed,'dd/mm/yyyy hh24:mi:ss') tarih,
      'exec dbms_stats.gather_table_stats(ownname=>null,tabname=>'''||
       table_name||''', cascade=>true)' as analyze
from user_tables
where last_analyzed is null
order by last_analyzed desc
/
