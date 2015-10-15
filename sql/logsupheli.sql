select sicil, to_char(tarih,'dd-mm-yyyy hh24:mi:ss') as tarih, osuser
from log_supheli
order by sicil, tarih asc
/
