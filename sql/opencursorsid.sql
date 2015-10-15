SELECT b.SID, UPPER(a.NAME), b.VALUE
FROM v$statname a, v$sesstat b, v$session c
WHERE a.statistic# = b.statistic#
  AND c.SID = b.SID
  AND LOWER(a.NAME) LIKE '%'||LOWER('CURSOR')||'%'
  AND b.SID in (&1)
UNION
SELECT SID, 'v$open_cursor opened cursor', COUNT(*)
FROM v$open_cursor
WHERE SID in (&1)
GROUP BY SID
ORDER BY SID
/
