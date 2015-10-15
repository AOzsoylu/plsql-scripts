select segment_type, tablespace_name, owner||'.'||segment_name as object
from dba_segments where segment_name in (
    select distinct table_name from dba_indexes where table_name =upper('&1')
    union
    select index_name from dba_indexes where table_name =upper('&1')
)
/
