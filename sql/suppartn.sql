select index_name, partition_name, subpartition_name
from user_ind_subpartitions
where index_name like Upper('%&1%')
order by index_name, partition_name, subpartition_name
/
