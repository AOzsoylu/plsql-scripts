select owner, scr from (
SELECT owner, 'create or replace '||decode(owner,'PUBLIC','public',null)||' synonym '||decode(owner,'PUBLIC',null,owner||'.')||synonym_name||
       ' for '||table_owner||'.'||table_name||decode(db_link,NULL,' ','@'||db_link)||';' as scr
FROM dba_synonyms
WHERE synonym_name in ( select object_name from all_objects
                        where status != 'VALID' and object_type = 'SYNONYM' )
union all
select owner, 'alter '||decode(object_type,'PACKAGE BODY','PACKAGE','TYPE BODY','TYPE',object_type)||' "'||owner||'"."'||object_name||
              '" compile '||decode(object_type,'PACKAGE BODY','BODY;',
                                              'TYPE BODY','BODY;',
                                              'FUNCTION','timestamp ''2001-01-01:01:01:01'';',
                                              'PROCEDURE','timestamp ''2001-01-01:01:01:01'';',
                                              'PACKAGE','timestamp ''2001-01-01:01:01:01'';',
                                              ';') as scr
from all_objects
--where status != 'VALID' and object_type != 'SYNONYM' and owner not in ('AMAC','ADES','EGEDEN','MUHASEBE')
where status != 'VALID' and object_type != 'SYNONYM' and owner not in ('AMAC','ADES','EGEDEN')
union all
select 'ZZZZZZ' as owner, '@compileinvalid' as scr from dual )
order by 1,2
/
