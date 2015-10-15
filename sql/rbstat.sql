SELECT Substr(r.segment_name,1,15) "Name",
       Substr(r.tablespace_name,1,15) "Tablespace",
       r.status "Status",
       TO_CHAR((s.bytes / 1024 / 1024),'99999990.000') "Size (M)"
  FROM sys.dba_rollback_segs r, sys.dba_segments s
  WHERE r.segment_name = s.segment_name
    AND s.segment_type = 'ROLLBACK'
/
