TTITLE 'Scheduler Objects:'
COL owner               FORMAT A15  HEADING 'Owner'
COL object_type         FORMAT A20  HEADING 'Object|Type'
COL object_name         FORMAT A30  HEADING 'Name'
COL created             FORMAT A20  HEADING 'Created On'
COL status              FORMAT A12  HEADING 'Status'
SELECT
     owner
    ,object_type
    ,object_name
    ,created
    ,status
  FROM dba_objects
 WHERE object_type IN ('PROGRAM', 'JOB', 'JOB CLASS', 'SCHEDULE', 'WINDOW')
 ORDER BY object_type, OBJECT_name
/
