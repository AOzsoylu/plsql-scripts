COL owner               FORMAT A20    HEADING 'Owner'
COL job_name            FORMAT A30    HEADING 'Job'
COL session_id          FORMAT 9999999 HEADING 'Session'
COL running_instance    FORMAT A15    HEADING 'Running|Instance'
COL elapsed_time        FORMAT A20    HEADING 'Elapsed|Time'
TTITLE 'Scheduled Tasks Running Right Now:'
SELECT
     owner
    ,job_name
    ,session_id
    ,running_instance
    ,elapsed_time
 FROM dba_scheduler_running_jobs
/
