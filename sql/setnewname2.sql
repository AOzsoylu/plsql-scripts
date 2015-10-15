select 'set newname for datafile '||to_char(file#,'999999')||' to ''<NEWPATH>'||Lower(tsname)||'.'||LTRIM(to_char(file#,'000009'))||'.dbf'';' as scriptx
from (
       select a.ts#, a.name as tsname, b.file#, b.name as filename
       from v$tablespace a, v$datafile b
       where a.ts# = b.ts#
       order by a.ts#, b.file#
    ) order by file#
/
