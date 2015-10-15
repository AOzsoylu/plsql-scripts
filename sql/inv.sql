select RPAD(object_type,20,' ')||RPAD(owner||'.'||object_name,60,' ')||
       'ALTER '||decode(object_type,'PACKAGE BODY','PACKAGE','TYPE BODY','TYPE',object_type)||' "'||owner||'"."'||object_name||
              '" COMPILE '||decode(object_type,'PACKAGE BODY','BODY;',
                                               'TYPE BODY','BODY;',
                                               'FUNCTION','timestamp ''2001-01-01:01:01:01'';',
                                               'PROCEDURE','timestamp ''2001-01-01:01:01:01'';',
                                               'PACKAGE','timestamp ''2001-01-01:01:01:01'';',
                                               ';') as scr
from all_objects
where status != 'VALID'
order by owner, object_type, object_name
/
