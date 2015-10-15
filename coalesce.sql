select 'alter tablespace '||tablespace_name||' coalesce;'
 from dba_tablespaces where tablespace_name like Upper('%&tbs%')
/
