select dest_id, Substr(dest_name,1,40) as dest, status, error, Substr(destination,1,20) as dest_name, db_unique_name
from v$archive_dest_status
where status != 'INACTIVE'
/
