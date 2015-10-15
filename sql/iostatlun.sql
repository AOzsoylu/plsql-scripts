select substr(file_name,1,10) as name,
       sum(RW) as RW,
       sum(BlockRW) as BlockRW,
       sum(reads) as reads,
       sum(blockreads) as blockreads,
       sum(writes) as writes,
       sum(blockwrites) as  blockwrites
from (
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
)
group by substr(file_name,1,10)
 ORDER BY 1, 3
/
