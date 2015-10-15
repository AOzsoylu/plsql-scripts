select
      'exec dbms_stats.gather_table_stats(ownname=>'''||table_owner||''',tabname=>'''||
       table_name||''', degree=>8, cascade=>true)' as analyze,
num_rows, last_analyzed, tot_updates, table_owner, table_name, partition_name, subpartition_name,
inserts, updates, deletes, timestamp, truncated
, to_char(perc_updates, 'FM999,999,999,990.00') perc_updates
from (
        select a.*
        , nvl(decode(num_rows, 0, '-1', 100 * tot_updates / num_rows), -1) perc_updates
        from (
          select
                  (select num_rows from dba_tables where dba_tables.table_name = DBA_TAB_MODIFICATIONS.table_name
                  and DBA_TAB_MODIFICATIONS.table_owner = dba_tables.owner) num_rows
                , (select last_analyzed from dba_tables where dba_tables.table_name = DBA_TAB_MODIFICATIONS.table_name
                  and DBA_TAB_MODIFICATIONS.table_owner = dba_tables.owner) last_analyzed
                , (inserts + updates + deletes) tot_updates
                , DBA_TAB_MODIFICATIONS.*
                from sys.DBA_TAB_MODIFICATIONS
        ) a
) b
where perc_updates > 5
and table_owner not in  ('SYS','SYSTEM','SYSMAN','DBSNMP','QUEST')
/
