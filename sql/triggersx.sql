select trigger_name, status, table_owner||'.'||table_name as table_name
from user_triggers
where table_name=Upper('&1')
order by 3,1,2
/
