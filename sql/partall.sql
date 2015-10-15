select table_owner, partition_name, high_value,
       To_Char(last_analyzed,'DD-MM-YYYY HH24:MI:SS')||'     ' as tarih
from all_tab_partitions
where table_name = UPPER('&1')
order by 1,2
/
