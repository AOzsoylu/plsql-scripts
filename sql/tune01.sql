select sum(pins) execs,
       sum(reloads) misses,
       to_char(sum(reloads)/sum(pins),'fm999999999999.999999') hitratio
from v$librarycache
/
