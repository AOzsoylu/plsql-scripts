SELECT TO_CHAR(100*(sess/calls), '999999999990.00')||'%' as cursor_cache_hits,
       TO_CHAR(100*((calls-sess-hard)/calls), '999990.00')||'%' as soft_parses,
       TO_CHAR(100*(hard/calls), '999990.00')||'%' as hard_parses
FROM ( SELECT value as calls FROM v$sysstat
       WHERE name = 'parse count (total)' ),
     ( SELECT value as hard FROM v$sysstat
       WHERE name = 'parse count (hard)' ),
     ( SELECT value as sess FROM v$sysstat
       WHERE name = 'session cursor cache hits' )
/
