 select 'EXEC DBMS_STATS.DELETE_TABLE_STATS(OWNNAME=>NULL, TABNAME=>'''||tname||''')'||chr(13)||chr(10)||
        'EXEC DBMS_STATS.LOCK_TABLE_STATS(OWNNAME=>NULL, TABNAME=>'''||tname||''')' as script2
 from tab
 where tname like Upper('%&tname%')
order by tname
/
