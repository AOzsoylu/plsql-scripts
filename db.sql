set heading off feedback off
show user
select instance_name||'@'||host_name from v$instance
/
set heading on feedback on
prompt
