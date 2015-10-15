select index_name, partition_name, subpartition_name from user_ind_subpartitions
where index_name = Upper('&indexname')
/
