select 'DESC '||owner||'.'||table_name from dba_tables
where table_name like Upper('&1'||'%')
order by owner, table_name
/
