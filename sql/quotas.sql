select username, tablespace_name, bytes, max_bytes, 'alter user '||username||' quota unlimited on '||tablespace_name||';' as script
from dba_ts_quotas
order by 1,2
/
