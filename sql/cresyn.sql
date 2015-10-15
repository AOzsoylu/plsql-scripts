SELECT 'create or replace synonym '||synonym_name||
       ' for '||table_owner||'.'||table_name||decode(db_link,NULL,' ','@'||db_link)||';' as scr
FROM user_synonyms
/
