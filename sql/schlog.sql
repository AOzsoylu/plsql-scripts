COL log_id              FORMAT 99999999   HEADING 'Log#'
COL log_date            FORMAT A40    HEADING 'Log Date'
COL owner               FORMAT A20    HEADING 'Owner'
COL job_name            FORMAT A30    HEADING 'Job'
COL status              FORMAT A30    HEADING 'Status'
TTITLE 'Scheduled Tasks History:'
SELECT
     log_id
    ,log_date
    ,owner
    ,job_name
    ,status
  FROM dba_scheduler_job_log
  WHERE owner NOT IN ('EXFSYS')
  ORDER BY 1
/
