select owner, segment_type, to_char(sum(bytes),'999,999,999,999,999') as bytes
from dba_extents
where owner not in ('DBSNMP','EXFSYS','OUTLN','SYS','SYSTEM','TSMSYS','WMSYS')
group by owner, segment_type
order by 1,2
/
