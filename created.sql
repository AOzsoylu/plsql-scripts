select to_char(last_ddl_time,'yyyy-mm-dd hh24:mi:ss')||' : '||
       to_char(created,'yyyy-mm-dd hh24:mi:ss')||' |   '||
       object_type||' - '||object_name as cresatir
from user_objects
order by last_ddl_time, created, object_type
/
