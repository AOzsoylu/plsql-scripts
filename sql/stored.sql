select object_type||' '||object_name from user_objects
where object_type in ('FUNCTION','PROCEDURE','PACKAGE','TRIGGER')
/
