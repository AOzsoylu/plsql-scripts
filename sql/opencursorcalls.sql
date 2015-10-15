SELECT RPAD(ss.username,20) as username, se.sid as sid,
       SUM(DECODE(name,'recursive calls',value)) as "Recursive Calls",
       SUM(DECODE(name,'opened cursors cumulative',value)) as "Opened Cursors",
       SUM(DECODE(name,'opened cursors current',value)) as "Current Cursors"
FROM v$session ss, v$sesstat se, v$statname sn
WHERE se.statistic# = sn.statistic#
  AND (name like '%opened cursors current%' OR
       name like '%recursive calls%'        OR
       name like '%opened cursors cumulative%' )
  AND se.sid = ss.sid
  AND ss.username is not null
GROUP BY RPAD(ss.username,20), se.sid
ORDER BY 5,4,3,2,1
/
