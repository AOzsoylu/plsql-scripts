set head off feedback off verify off trimspool on
set linesize 1000
set pagesize 10000
spool analyzetmpall.lst
select script from
(
  select 1 as sira, tname,
         'EXEC DBMS_STATS.DELETE_TABLE_STATS(OWNNAME=>NULL, TABNAME=>'''||tname||''')' as script
  from tab where tabtype ='TABLE'
  union
  select 2 as sira, tname,
         'EXEC DBMS_STATS.LOCK_TABLE_STATS(OWNNAME=>NULL, TABNAME=>'''||tname||''')' as script
  from tab where tabtype ='TABLE'
)
order by tname, sira;
spool off
@analyzetmpall.lst
set head on feedback on verify on trimspool on
set linesize 1000
set pagesize 1000
host del analyzetmpall.lst
