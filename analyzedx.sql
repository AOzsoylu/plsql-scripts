select table_name, to_char(last_analyzed,'dd/mm/yyyy hh24:mi:ss') tarih,
      'exec dbms_stats.gather_table_stats(ownname=>null,tabname=>'''||
       table_name||''', degree=>8, cascade=>true)' as analyze
from user_tables
where table_name like Upper('&tabname%')
order by last_analyzed desc
/
