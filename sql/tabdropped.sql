column original_name format A32
select
 object_name, original_name, operation, type, droptime
from
 user_recyclebin
/
prompt ~~~~~~~~~
prompt flashback table <original_name> to before drop [rename to xx];
prompt ~~~~~~~~~
