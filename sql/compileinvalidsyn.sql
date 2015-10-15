SELECT 'create or replace '||decode(owner,'PUBLIC','public',null)||' synonym '||synonym_name||
       ' for '||table_owner||'.'||table_name||decode(db_link,NULL,' ','@'||db_link)||';' as scr
FROM dba_synonyms
WHERE synonym_name in ( select object_name from all_objects
                        where status != 'VALID' and object_type = 'SYNONYM' )
/
