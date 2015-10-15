select index_name, partition_name, subpartition_name, status from user_ind_subpartitions
where index_name IN (select index_name from user_indexes where table_name = Upper('&tabname') )
order by index_name, partition_name, subpartition_name
/
