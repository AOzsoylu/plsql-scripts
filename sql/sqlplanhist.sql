select Substr(s.begin_interval_time,1,30)||' --> '||Substr(s.end_interval_time,1,30) as zaman,
       q.snap_id,
       q.dbid,
       q.sql_id,
       q.plan_hash_value,
       q.optimizer_cost,
       q.optimizer_mode
from dba_hist_sqlstat q, dba_hist_snapshot s
where q.dbid = ( select dbid from v$database ) and q.sql_id = '&sqlid'
  and q.snap_id = s.snap_id
  and s.begin_interval_time between sysdate-30 and sysdate
order by s.snap_id desc
/
