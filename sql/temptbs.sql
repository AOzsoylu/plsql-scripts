SELECT
   d.status "Status",
   d.tablespace_name "Name",
   d.contents "Type",
   d.extent_management "Extent Management",
   TO_CHAR(NVL(t.bytes, 0)/1024/1024,'99999999.999') "Used (M)"
FROM sys.dba_tablespaces d,
     (select tablespace_name, 0 bytes from v$temp_extent_pool group by tablespace_name) a,
     (select tablespace_name, sum(bytes_cached) bytes from v$temp_extent_pool group by tablespace_name) t
WHERE d.tablespace_name = a.tablespace_name(+)
  AND d.tablespace_name = t.tablespace_name(+)
  AND d.extent_management like 'LOCAL'
  AND d.contents like 'TEMPORARY'
ORDER BY 3,1,2
/
