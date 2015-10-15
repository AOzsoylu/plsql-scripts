select table_name, myscript from (
select table_name, 'alter table '||table_name||' drop constraint '||constraint_name||';' as myscript
from dba_constraints where owner = Upper('&1') and constraint_type='P' and constraint_name in (
       select segment_name from dba_segments where tablespace_name like upper('&2%') )
union all
select table_name, 'drop index '||index_name||';'  as myscript
from dba_indexes where owner = Upper('&1') and index_name in (
       select segment_name from dba_segments where tablespace_name like upper('&2%') )
   and index_name not in (
       select constraint_name from dba_constraints where owner = Upper('&1') and constraint_type='P' )
) order by table_name
/
