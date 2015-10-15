select script from
(
  select 1 as sira, tname,
         'EXEC DBMS_STATS.DELETE_TABLE_STATS(OWNNAME=>NULL, TABNAME=>'''||tname||''')' as script
  from tab where tabtype ='TABLE' and tname like '%'||Upper('&1')||'%'
  union
  select 2 as sira, tname,
         'EXEC DBMS_STATS.LOCK_TABLE_STATS(OWNNAME=>NULL, TABNAME=>'''||tname||''')' as script
  from tab where tabtype ='TABLE' and tname like '%'||Upper('&1')||'%'
)
order by tname, sira
/
