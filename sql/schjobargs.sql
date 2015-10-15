COL job_name            FORMAT A20  HEADING 'Job'
COL argument_name       FORMAT A20  HEADING 'Arg Name'
COL argument_position   FORMAT 999  HEADING 'Arg|Pos'
COL value               FORMAT A40  HEADING 'Argument Value'
TTITLE 'Job Arguments:'
SELECT
    job_name
   ,argument_name
   ,argument_position
   ,value
  FROM dba_scheduler_job_args
/
