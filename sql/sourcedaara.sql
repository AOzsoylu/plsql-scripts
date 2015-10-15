select distinct OWNER, TYPE, name
from dba_source
where upper(text) like Upper('%&aranacak%')
order by 1,2,3
/
