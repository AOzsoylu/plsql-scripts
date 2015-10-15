select tablespace_name,
       (bytes/1048576) as filesize,
       (maxbytes/1048576) as maxsize,
       DECODE(autoextensible,'YES','+',' ') as auto,
       file_name
from dba_data_files
where Upper(file_name) like Upper('%&filename%')
order by tablespace_name, file_name
/
