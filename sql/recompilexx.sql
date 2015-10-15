select 'ALTER '||object_type||' '||owner||'."'||object_name||'" COMPILE TIMESTAMP ''2001-01-01:01:01:01'';'
from dba_objects
where owner = Upper('&owner')
  and object_type in ('FUNCTION','PROCEDURE','PACKAGE' )
  and timestamp != '2001-01-01:01:01:01'
/
