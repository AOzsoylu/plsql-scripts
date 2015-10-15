select index_name, status, partitioned from user_indexes
where index_name IN (select index_name from user_indexes where table_name = Upper('&tabname') )
order by index_name
/
