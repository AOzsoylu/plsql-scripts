select owner, status, created, last_ddl_time, object_type, object_name
from dba_objects where object_name like Upper('%'||'&objname'||'%')
/
