set head off feedback off verify off trimspool on
set linesize 1000
set pagesize 10000
spool analyzetmp.lst
select script from
(
  select 1 as sira, tname,
         'EXEC DBMS_STATS.DELETE_TABLE_STATS(OWNNAME=>NULL, TABNAME=>'''||tname||''')' as script
  from tab where tabtype ='TABLE' and tname like 'TMP%'
  union
  select 2 as sira, tname,
         'EXEC DBMS_STATS.LOCK_TABLE_STATS(OWNNAME=>NULL, TABNAME=>'''||tname||''')' as script
  from tab where tabtype ='TABLE' and tname like 'TMP%'
)
order by tname, sira;
spool off
@analyzetmp.lst
set head on feedback on verify on trimspool on
set linesize 1000
set pagesize 1000
host del analyzetmp.lst
