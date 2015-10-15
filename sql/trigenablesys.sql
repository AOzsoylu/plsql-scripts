select 'alter trigger '||trigger_name||' enable;' from user_triggers
where trigger_name like 'TRIG%'
/
