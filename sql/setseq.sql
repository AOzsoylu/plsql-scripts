select 'select '||sequence_name||'.nextval from all_objects where rownum <= &sayi;'
from user_sequences
order by sequence_name
/
