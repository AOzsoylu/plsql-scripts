select username, count(*) as sayi
from v$session group by username
order by username
/
