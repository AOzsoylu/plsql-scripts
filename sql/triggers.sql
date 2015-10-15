select trigger_name, status, table_owner||'.'||table_name as table_name
from user_triggers
order by 3,1,2
/
