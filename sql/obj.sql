select * from all_objects where object_name like Upper('&objname'||'%')
order by object_name, owner
/
