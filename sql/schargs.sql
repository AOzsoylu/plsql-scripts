TTITLE 'Program Arguments:'
COL owner               FORMAT A15  HEADING 'Owner'
COL program_name        FORMAT A30  HEADING 'Program'
COL argument_name       FORMAT A20  HEADING 'Arg Name'
COL argument_position   FORMAT 999  HEADING 'Arg|Pos'
COL argument_type       FORMAT A12  HEADING 'Arg Type'
COL default_value       FORMAT A12  HEADING 'Default|Value'
COL out_argument        FORMAT A06  HEADING 'Out|Arg?'
SELECT
     owner
    ,program_name
    ,argument_name
    ,argument_position
    ,argument_type
    ,default_value
    ,out_argument
  FROM dba_scheduler_program_args
/
