select sum(gets) hits,
       sum(getmisses) libmiss,
       sum(getmisses)/sum(gets) rcratio
from v$rowcache
/
