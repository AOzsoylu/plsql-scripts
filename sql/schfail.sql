COL log_id              FORMAT 99999999   HEADING 'Log#'
COL log_date            FORMAT A40    HEADING 'Log Date'
COL owner               FORMAT A20    HEADING 'Owner'
COL job_name            FORMAT A30    HEADING 'Job'
COL status              FORMAT A15    HEADING 'Status'
COL actual_start_date   FORMAT A40    HEADING 'Actual|Start|Date'
COL error#              FORMAT 99999999 HEADING 'Error|Nbr'
TTITLE 'Scheduled Tasks That Failed:'
SELECT
     log_id
    ,log_date
    ,owner
    ,job_name
    ,status
    ,actual_start_date
    ,error#
  FROM dba_scheduler_job_run_details
 WHERE status <> 'SUCCEEDED'
 ORDER BY actual_start_date
/
