select  rownum as satir, Substr(TEXT,1,500) as text
from DBA_SOURCE
where owner= Upper('&1')
  and type=Upper('&2')
  and name=Upper('&3')
order by line
/
