select owner, 'alter trigger '||owner||'.'||trigger_name||' disable;' from dba_triggers where status !='DISABLED' order by 1,2
/
