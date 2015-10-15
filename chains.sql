select table_name, pct_free, pct_used, chain_cnt
from dba_all_tables
where owner = Upper('&owner')
/
