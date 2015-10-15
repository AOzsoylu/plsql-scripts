SELECT Substr(RPAD(owner||'.'||synonym_name,40,' ')||' --> '||
       table_owner||'.'||table_name||decode(db_link,NULL,' ','@'||db_link),1,100) as syn
FROM dba_synonyms
WHERE owner NOT IN ('PUBLIC','SYSTEM','SYS')
ORDER BY owner, synonym_name
/
