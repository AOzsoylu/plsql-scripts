set head off feedback off verify off trimspool on
set linesize 1000
set pagesize 10000
spool tmp.lst
select 'alter tablespace '||tablespace_name||' coalesce;'
from dba_tablespaces;
spool off
@tmp.lst
set head on feedback on verify on trimspool on
set linesize 1000
set pagesize 1000
host del tmp.lst
