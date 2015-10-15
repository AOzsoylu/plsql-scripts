select 'drop '||object_type||' '||owner||'.'||object_name||DECODE(object_type,'TABLE',' purge',null)||';' from dba_objects
where object_type NOT IN ('PACKAGE BODY','DATABASE LINK','TRIGGER','INDEX')
  and owner = Upper('&owner')
/
