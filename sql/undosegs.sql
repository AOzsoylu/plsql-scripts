SELECT SEGMENT_NAME, STATUS, MAX_EXTENTS, TABLESPACE_NAME
  FROM DBA_ROLLBACK_SEGS
  WHERE TABLESPACE_NAME like '%UNDO%'
ORDER BY tablespace_name, segment_name, status
/
