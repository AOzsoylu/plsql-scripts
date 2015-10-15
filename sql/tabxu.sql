select table_name,
       Substr(location,1,30) "location",
       Substr(directory_owner||'.'||directory_name,1,30) "dir.owner"
from user_external_locations
order by table_name
/
