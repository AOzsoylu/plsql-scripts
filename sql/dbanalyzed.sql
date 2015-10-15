select table_name, to_char(last_analyzed,'dd/mm/yyyy hh24:mi:ss') tarih
from all_tables
where owner = upper('&owner') and last_analyzed is not null
order by last_analyzed desc
/
