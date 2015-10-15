select username, a.password as pwd, b.password as pwd11g2,
       'alter user '||name||' identified by values '''||b.password||''';' as script
from dba_users a, user$ b
where a.username=b.name
order by 1
/
