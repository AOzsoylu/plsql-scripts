select 'alter table '||table_name||' drop constraint '||constraint_name||';'
from user_constraints where constraint_type = 'R'
order by 1
/
