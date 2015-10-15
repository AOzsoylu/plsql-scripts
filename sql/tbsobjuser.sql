select segment_type, tablespace_name, owner||'.'||segment_name as object
from dba_segments
where owner = Upper('&owner')
  and tablespace_name like upper('&tbsname%')
order by 2,1,3
/
