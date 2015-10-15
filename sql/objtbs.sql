select segment_type, tablespace_name, owner||'.'||segment_name as object, partition_name
from dba_segments where segment_name like upper('&objname%')
order by 3,1,4,2
/
