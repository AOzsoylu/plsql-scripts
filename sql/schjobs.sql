COL owner               FORMAT A15  HEADING 'Owner'
COL job_name            FORMAT A30  HEADING 'Job'
COL program_name        FORMAT A30  HEADING 'Program|Name'
COL job_class           FORMAT A30  HEADING 'Job Class'
COL job_type            FORMAT A30  HEADING 'Job|Type'
COL job_action          FORMAT A100 HEADING 'Job|Action'
COL schedule_name       FORMAT A30  HEADING 'Schedule|Name'
COL enabled             FORMAT A15  HEADING 'Enabled?'
COL state               FORMAT A15  HEADING 'State'
COL restartable         FORMAT A15  HEADING 'Restart|-able?'
COL start_date          FORMAT A40  HEADING 'Start|Date'
COL comments            FORMAT A200 HEADING 'Comments'
SELECT
    owner
   ,job_name
   ,program_name
   ,schedule_name
   ,enabled
   ,comments
   ,start_date
   ,state
   ,job_class
   ,job_type
   ,job_action
   ,restartable
  FROM dba_scheduler_jobs
  ORDER BY 1,2,3,4
/
