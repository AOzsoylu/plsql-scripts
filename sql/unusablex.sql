select status, owner, index_name,
       'alter index '||owner||'.'||index_name||' rebuild parallel 32 nologging;' as script
from dba_indexes
where owner = upper('&owner') and status = 'UNUSABLE'
order by owner, index_name
/
