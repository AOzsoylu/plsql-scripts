select table_name, partition_name, 
       To_Char(last_analyzed,'DD-MM-YYYY HH24:MI:SS')||'     ' as tarih,
       high_value
from user_tab_partitions
order by table_name, partition_name
/
