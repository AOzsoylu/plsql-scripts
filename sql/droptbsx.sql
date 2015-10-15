select RPAD('drop tablespace '||a.name||' including contents and datafiles;',90,' ')||'rm '||b.name as islem
from v$tablespace a, v$datafile b
where a.ts# = b.ts# and a.name like Upper('%&tbsname%')
order by a.name
/
