select status, owner, index_name,
       'alter index '||owner||'.'||index_name||' rebuild parallel 32 nologging;' as script
from dba_indexes
where status = 'UNUSABLE'
union all
select status, index_owner, index_name,
       'alter index '||index_owner||'.'||index_name||' rebuild partition '||partition_name||' parallel 32;' as script
from dba_ind_partitions
where status = 'UNUSABLE'
union all
select status, index_owner, index_name,
       'alter index '||index_owner||'.'||index_name||' rebuild subpartition '||subpartition_name||' parallel 32;' as script
from dba_ind_subpartitions
where status = 'UNUSABLE'
order by 2,3,1,4
/
