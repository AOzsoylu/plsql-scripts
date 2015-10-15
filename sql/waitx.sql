select count(*) as sayi, p1 file#, p2 blk#, p3 "class/blocks"
from v$session_wait
where event = '&waitevent'
group by p1, p2, p3
/
