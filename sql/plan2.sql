SELECT  a.SQL_ID, a.INSTANCE_NUMBER, a.SNAP_ID,
        TO_CHAR(b.END_INTERVAL_TIME, 'DD-MON-YYYY HH24:MI') snap_time,
        a.PLAN_HASH_VALUE,
        ROUND(a.ELAPSED_TIME_DELTA/1000000) elapsed_seconds,
        ROUND(a.CPU_TIME_DELTA/1000000)        cpu_seconds,
        a.ROWS_PROCESSED_DELTA             rows_processed,
        a.BUFFER_GETS_DELTA              buffer_gets,
        a.DISK_READS_DELTA              disk_reads,
        a.EXECUTIONS_DELTA              executions,
        a.PARSE_CALLS_DELTA            parses
FROM DBA_HIST_SQLSTAT a, DBA_HIST_SNAPSHOT b
WHERE a.SNAP_ID = b.SNAP_ID
  AND a.INSTANCE_NUMBER=b.INSTANCE_NUMBER
  AND a.INSTANCE_NUMBER=1
  AND a.SQL_ID='&1'
ORDER BY a.SNAP_ID 
/
