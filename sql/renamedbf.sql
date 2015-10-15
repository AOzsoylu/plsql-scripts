select 'alter database rename file '''||RPAD(name||'''',50)||' to '''||name||''';'
from v$datafile order by 1
/
