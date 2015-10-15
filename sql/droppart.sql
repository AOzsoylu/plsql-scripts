SELECT 'alter table '||table_name||' drop partition '||partition_name||';'
from user_tab_partitions
where table_name like Upper('%&tablename%')
order by partition_name
/
