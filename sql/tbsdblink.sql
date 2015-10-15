SELECT
   d.status, 
   d.tablespace_name as name, 
   NVL(a.bytes - NVL(f.bytes, 0), 0) as used, 
   NVL(a.bytes,0) as total 
FROM dba_tablespaces@&dblink d, 
     (select tablespace_name, sum(bytes) bytes from dba_data_files@&dblink group by tablespace_name) a, 
     (select tablespace_name, sum(bytes) bytes from dba_free_space@&dblink group by tablespace_name) f 
WHERE d.tablespace_name = a.tablespace_name(+) 
  AND d.tablespace_name = f.tablespace_name(+) 
  AND NOT (d.extent_management like 'LOCAL' AND d.contents like 'TEMPORARY')
/
