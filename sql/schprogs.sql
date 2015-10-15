COL owner               FORMAT A15  HEADING 'Owner'
COL program_name        FORMAT A30  HEADING 'Program'
COL program_type        FORMAT A20  HEADING 'Type'
COL program_action      FORMAT A50  HEADING 'Action'
COL comments            FORMAT A200 HEADING 'Comments'
SELECT
     owner
    ,program_name
    ,program_type
    ,program_action
    ,comments
  FROM dba_scheduler_programs
ORDER BY 1,2
/
