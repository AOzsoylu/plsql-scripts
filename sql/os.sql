select Substr(banner,9,Instr(banner,':')-9) as "O/S"
from v$version where banner like 'TNS for%'
/
