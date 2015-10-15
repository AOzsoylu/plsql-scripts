select c.sid, c.address||':'||c.hash_value as address,
       count(c.saddr) as cursor#
from v$open_cursor c
group by c.sid, c.address||':'||c.hash_value
having count(c.saddr) > 10
order by 3 desc
/
