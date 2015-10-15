select table_name, partition_name, subpartition_name
from user_tab_subpartitions
where table_name like Upper('%&1%')
order by table_name, partition_name, subpartition_name
/
