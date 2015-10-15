select a.*, b.flags
from dba_objects a, sys.ind$ b
where a.object_id = b.obj#
  and bitand(b.flags,4096)=4096
/
