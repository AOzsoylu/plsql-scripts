select 'ALTER TABLE '||owner||'.'||table_name||' MODIFY ( '||column_name||' XXXXXXX(x) );'
from dba_tab_columns
where owner = Upper('&owner')
  and column_name = Upper('&columnname')
order by 1
/
