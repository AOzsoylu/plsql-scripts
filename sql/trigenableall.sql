select owner, 'alter trigger '||owner||'.'||trigger_name||' enable;' from dba_triggers where status !='ENABLED' order by 1,2
/
