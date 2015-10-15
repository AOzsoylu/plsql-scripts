COL owner               FORMAT A15  HEADING 'Owner'
COL schedule_name       FORMAT A30  HEADING 'Schedule'
COL start_date          FORMAT A30  HEADING 'Starts|On'
COL end_date            FORMAT A30  HEADING 'Ends|On'
COL repeat_interval     FORMAT A100 HEADING 'Interval'
COL comments            FORMAT A200 HEADING 'Comments'
SELECT
     owner
    ,schedule_name
    ,to_char(start_date, 'mm/dd/yyyy hh24:mi:ss') start_date
    ,to_char(end_date, 'mm/dd/yyyy hh24:mi:ss') end_date
    ,repeat_interval
    ,comments
  FROM dba_scheduler_schedules
ORDER BY 1,2
/
