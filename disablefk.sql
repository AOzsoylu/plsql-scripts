select 'alter table '||table_name||' disable constraint '||constraint_name||';'
from user_constraints where constraint_type = 'R'
and r_constraint_name = (select constraint_name from user_constraints
                          where table_name=Upper('&tname')
                            and constraint_type='P' )
/
