select grantee, grantor, table_name, privilege
from dba_tab_privs
where owner in ('&username')
  and grantee = 'PUBLIC'
  order by 1, 2
/
