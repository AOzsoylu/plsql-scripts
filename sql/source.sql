select  rownum as satir, Substr(TEXT,1,500) as text
from USER_SOURCE
where type=Upper('&1')
  and name=Upper('&2')
order by line
/
