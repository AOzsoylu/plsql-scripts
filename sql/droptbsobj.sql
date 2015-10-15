select decode(substr(segment_name,1,2),'PK','alter table '||substr(segment_name,4)||' drop constraint '||segment_name||';','drop index '||segment_name||';') from dba_segments where tablespace_name like upper('&tbsname%')
/
