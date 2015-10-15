select a.name as groupname, rpad(b.name,25,' ')||'->'||b.value as attribute
from v$asm_diskgroup a, v$asm_attribute b
where a.group_number = b.group_number
  and b.name not like 'template%'
order by 1,2
/
