select owner||'.'||table_name as name from dba_tables
where tablespace_name = UPPER('&1')
union
select '   '||owner||'.'||table_name||'->'||index_name as name from dba_indexes
where tablespace_name = UPPER('&1')
/
