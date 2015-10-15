select 'drop '||object_type||' '||object_name||';' from user_objects
where object_type IN ('SEQUENCE')
/
