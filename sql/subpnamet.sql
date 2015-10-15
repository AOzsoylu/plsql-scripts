select partition_name, subpartition_name from user_tab_subpartitions
where table_name = Upper('&tablename')
/
