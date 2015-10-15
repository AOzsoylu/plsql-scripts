select s.snap_id,
       s.snap_level,
       to_char(s.begin_interval_time,'dd-mm-yyyy hh24:mi:ss') snap_begin_time,
       to_char(s.end_interval_time,'dd-mm-yyyy hh24:mi:ss') snap_end_time
  from dba_hist_snapshot s
  where instance_number=(select instance_number from v$instance)
 order by snap_id
/
