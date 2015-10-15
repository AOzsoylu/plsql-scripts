select * from all_constraints where table_name = Upper('&tname') and constraint_type = 'P'
/
