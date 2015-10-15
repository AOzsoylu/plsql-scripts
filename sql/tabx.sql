select Substr('alter table '||owner||'.'||table_name||' location('''||lower(location)||''');',1,70) as chloc,
       owner, table_name,
       Substr(location,1,30) "location",
       Substr(directory_owner||'.'||directory_name,1,30) "dir.owner"
from dba_external_locations
order by owner, table_name
/
