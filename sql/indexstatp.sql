select index_name, partition_name, status from user_ind_partitions
where index_name IN (select index_name from user_indexes where table_name = Upper('&tabname') )
order by index_name, partition_name
/
