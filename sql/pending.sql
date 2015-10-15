SELECT
   a.usn,
   a.name,
   b.status,
   c.tablespace_name,
   d.addr,
   e.sid,
   e.serial#,
   e.username,
   e.program,
   e.machine,
   e.osuser
   FROM
   v$rollname a,
   v$rollstat b,
   dba_rollback_segs c,
   v$transaction d,
   v$session e
   WHERE
   a.usn=b.usn AND
   a.name=c.segment_name AND
   a.usn=d.xidusn AND
   d.addr=e.taddr AND
   b.status='PENDING OFFLINE'
/
