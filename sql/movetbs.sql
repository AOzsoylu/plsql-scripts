select decode(segment_type,'TABLE','alter table '||owner||'.'||segment_name||' move tablespace XX;',
                           'INDEX','alter index '||owner||'.'||segment_name||' rebuild tablespace XXNDX;')
from dba_segments where tablespace_name like upper('%&tbsname%')
order by 1
/
