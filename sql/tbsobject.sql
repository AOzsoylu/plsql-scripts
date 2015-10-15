select owner, segment_name, partition_name, segment_type
from dba_extents where tablespace_name like Upper('%&tbs%')
/
