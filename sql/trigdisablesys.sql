select 'alter trigger '||trigger_name||' disable;' from user_triggers
where trigger_name like 'TRIG%'
/
