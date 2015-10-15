select Substr(tablespace_name,1,20) as tbsname, status, Substr(file_name,1,80) as fname
 from dba_data_files where file_name like '%&filename%'
 order by 3
/
