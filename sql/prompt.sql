define prompt='SQL->'
column prompt new_value prompt
set termout off
select 'set sqlprompt '||
       DECODE(substr(localconnection,-4),'TEST','TEST>',
              substr(localconnection,1,3)||
                        DECODE(substr(localconnection,-3),'SOK','S>','->')
            ) as prompt
from dual
/
set termout on
set sqlprompt &prompt
