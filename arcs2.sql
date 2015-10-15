select to_char(completion_time,'yyyy-mm-dd') as tarih, count(distinct sequence#) as ARCSAY
from v$archived_log
group by to_char(completion_time,'yyyy-mm-dd')
order by 1
/
