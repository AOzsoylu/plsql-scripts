SELECT (s.phyrds + s.PHYWRTS) RW,
       (s.phyblkrd + s.phyblkwrt) BlockRW,
       s.phyrds reads,
       s.phyblkrd blockreads,
       s.phywrts writes,
       s.phyblkwrt blockwrites,
       t.name ts_name,
       f.name file_name
FROM v$tablespace t, v$datafile f, v$filestat s
 WHERE t.ts# = f.ts# and f.file# = s.file#
 ORDER BY phyrds desc, phywrts desc
/
