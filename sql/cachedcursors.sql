SELECT 'session_cached_cursors' as parameter,
       LPAD(value, 5) as value,
       DECODE(value,0,'  n/a',to_char(100*(used/value),'990')||'%') as usage
FROM ( SELECT MAX(s.value) used
       FROM v$statname n, v$sesstat s
       WHERE n.name = 'session cursor cache count'
         and s.statistic# = n.statistic# ),
     ( SELECT value FROM v$parameter
       WHERE name = 'session_cached_cursors' )
UNION ALL
SELECT 'open_cursors' as parameter, LPAD(value,5) as value,
       To_char(100*(used/value),'990')||'%' as usage
FROM ( SELECT MAX(sum(s.value)) as used
       FROM v$statname n, v$sesstat s
       WHERE n.name in ('opened cursors current', 'session cursor cache count')
         and s.statistic# = n.statistic#
       GROUP BY s.sid ),
     ( SELECT value FROM v$parameter WHERE name = 'open_cursors' )
/
