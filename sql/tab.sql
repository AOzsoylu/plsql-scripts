select tname, tabtype, clusterid, null as monitoring
from tab where tabtype != 'TABLE'
union
select table_name as tname, 'TABLE' as tabtype, null as clusterid, monitoring
from user_tables
union
select table_name as tname, 'NESTED' as tabtype, null as clusterid, null as monitoring
from user_nested_tables
order by 1
/
