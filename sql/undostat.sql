SELECT r.segment_name, r.owner, r.tablespace_name, r.status,
       r.initial_extent/1024/1024 initial_extent, r.next_extent/1024/1024 next_extent,
       s.extents, ROUND(s.rssize/1024/1024) rssize, s.xacts
 FROM dba_rollback_segs r, v$rollname n, v$rollstat s
 WHERE r.segment_name = n.name
   and n.usn = s.usn
/
