set linesize 10000
set pagesize 10000
select   to_char (timestamp, 'YYYY-MM-DD HH24:MI:SS') timestamp
        ,id
        ,plan_hash_value
        ,cost
        ,cardinality
        ,cpu_cost
        ,io_cost
        ,plan_hash_value
        ,optimizer
        ,bytes
        ,time
        , lpad (' ', depth)
           || operation
           || ' '
           || options
           || decode (object_name, null, null, ' (' || object_name || ')') action
-- from v$sql_plan
from dba_hist_sql_plan
-- where plan_hash_value='&xplan_hash_value'
where sql_id = '&xsql_id'
order by 1 desc, 2
/
