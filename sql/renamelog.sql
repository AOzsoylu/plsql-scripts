select 'alter database rename file '''||RPAD(member||'''',50)||' to '''||member||''';'
from v$logfile order by 1
/
