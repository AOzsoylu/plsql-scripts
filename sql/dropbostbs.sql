select 'drop tablespace '||tablespace_name||' including contents and datafiles cascade constraints;'
from ( select tablespace_name from dba_tablespaces where contents = 'PERMANENT'
       minus
       ( select distinct tablespace_name from dba_tables
         union
         select distinct tablespace_name from dba_indexes
         union
         select distinct tablespace_name from dba_tab_partitions
         union
         select distinct tablespace_name from dba_ind_partitions
       )
     )
order by tablespace_name
/
