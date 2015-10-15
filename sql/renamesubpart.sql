select 'alter table '||table_owner||'.'||table_name||' rename subpartition '||subpartition_name||' to subp'||
        Substr(partition_name,2)||decode(Mod(rownum,4),1,'a',2,'b',3,'c','d')||';'
from dba_tab_subpartitions
  WHERE table_owner not in ('SYS','SYSAUX')
    and subpartition_name like 'SYS%'
union
select 'alter index '||index_owner||'.'||index_name||' rename subpartition '||subpartition_name||' to subp'||
        Substr(partition_name,2)||decode(Mod(rownum,4),1,'a',2,'b',3,'c','d')||';'
from dba_ind_subpartitions
  WHERE index_owner not in ('SYS','SYSAUX')
    and subpartition_name like 'SYS%'
/
