set head off feedback off verify off trimspool on
set linesize 1000
set pagesize 10000
spool droptab.lst
@droptab
spool off
@droptab.lst
set head on feedback on verify on trimspool on
set linesize 1000
set pagesize 1000
host del droptab.lst
