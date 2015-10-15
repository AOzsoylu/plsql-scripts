SELECT owner, table_owner,
       RPAD('drop '||decode(owner,'PUBLIC','public',null)||' synonym '||decode(owner,'PUBLIC',null,owner||'.')||synonym_name||';',70,' ')||
       'create or replace '||decode(owner,'PUBLIC','public',null)||' synonym '||decode(owner,'PUBLIC',null,owner||'.')||synonym_name||
       ' for '||table_owner||'.'||table_name||decode(db_link,NULL,' ','@'||db_link)||';' as createscr
FROM dba_synonyms where table_owner = Upper('&towner')
order by 1,2
/
