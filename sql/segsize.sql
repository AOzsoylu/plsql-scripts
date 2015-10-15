select segment_type, To_Char(sum(bytes)/1048576,'9999999990.000') as megabytes
from dba_segments
group by segment_type
order by 1
/
