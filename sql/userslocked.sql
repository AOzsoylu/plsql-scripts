select Substr(a.account_status,1,1) as status,
       a.username,
       count(b.object_id) "object#",
       a.default_tablespace,
       a.profile,
       a.temporary_tablespace,
       a.password
from dba_users a, dba_objects b
where a.username = b.owner(+)
  and a.account_status = 'LOCKED'
group by Substr(a.account_status,1,1),
         a.username, a.default_tablespace,
         a.profile, a.temporary_tablespace, a.password
order by 1 desc,2 asc
/
