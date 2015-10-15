select 'set newname for datafile '||file#||' to ''/NEWPATH/'||substr(name,instr(name,'/',-1)+1)||''';' as scriptx
from v$datafile order by file#
/
