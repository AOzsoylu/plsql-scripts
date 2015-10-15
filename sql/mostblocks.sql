select file#, block#, count(*)
from v$bh
group by file#, block#
having count(*) > 3
order by 3,1,2
/
