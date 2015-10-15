select distinct tablespace_name from dba_rollback_segs where tablespace_name like 'UNDO%' and status='ONLINE' order by 1
/
