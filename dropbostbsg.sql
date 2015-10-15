set head off feedback off verify off trimspool on
set linesize 1000
set pagesize 10000
spool droptbs.lst
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
spool off
@droptbs.lst
set head on feedback on verify on trimspool on
set linesize 1000
set pagesize 1000
host del droptbs.lst
