set head off feedback off verify off trimspool on
set linesize 1000
set pagesize 10000
spool tmpstats.lst
select script from
(
select table_name, 1 as sira, 'begin' as script
  from user_tables where table_name like 'TMP%' and monitoring = 'YES'
union all
select table_name, 2 as sira, '  dbms_stats.delete_table_stats(null,'''||table_name||''');' as script
  from user_tables where table_name like 'TMP%' and monitoring = 'YES'
union all
select table_name, 3 as sira, '  dbms_stats.lock_table_stats(null,'''||table_name||''');' as script
  from user_tables where table_name like 'TMP%' and monitoring = 'YES'
union all
select table_name, 4 as sira, 'end;' as script
  from user_tables where table_name like 'TMP%' and monitoring = 'YES'
union all
select table_name, 5 as sira, '/' as script
  from user_tables where table_name like 'TMP%' and monitoring = 'YES'
)
order by table_name, sira;
spool off
@tmpstats.lst
set head on feedback on verify on trimspool on
set linesize 1000
set pagesize 1000
host del tmpstats.lst
