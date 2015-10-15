select * from user_constraints where r_constraint_name = (
select constraint_name from user_constraints
  where table_name = Upper('&tablename')
    and constraint_name like 'PK%' )
/
