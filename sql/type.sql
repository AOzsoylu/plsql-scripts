select type, text from user_source
where name = Upper('&1')
/
