select Substr(segment_name,1,30) as name, count(*) as sayi, to_char(sum(bytes),'999,999,999,999,999') as bytes
from dba_extents where owner = Upper('&owner') and segment_name like Upper('%&segment%')
group by Substr(segment_name,1,30)
order by 3
/
