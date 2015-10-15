select 'oracle_sid : '||instance as "oracle_sid and db_name" from v$thread
union all
select 'db_name    : '||name as "oracle_sid and db_name" from v$database
/
