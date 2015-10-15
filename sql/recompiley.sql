select 'ALTER '||object_type||' "'||object_name||'" COMPILE TIMESTAMP ''2001-01-01:01:01:01'';'
from user_objects
where object_type in ('FUNCTION','PROCEDURE','PACKAGE' )
  and timestamp != '2001-01-01:01:01:01'
/
