select tablespace_name,
       (bytes/1048576) as filesize,
       DECODE(autoextensible,'YES','+',' ') as auto,
       file_name
from dba_data_files
where tablespace_name like Upper('&tablespacename'||'%')
order by tablespace_name, file_name
/
