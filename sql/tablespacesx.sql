column "     Used [M]/     Size [M]" format a30
column " Used %" format a8
SELECT
   d.status "Status",
   d.tablespace_name "Name",
   d.contents "Type",
   d.extent_management "Extent Management",
   TO_CHAR(NVL(a.bytes - NVL(f.bytes, 0), 0)/1024/1024,'99999990.000') ||'/'||TO_CHAR(NVL(a.bytes/1024/1024, 0), '99999990.000') as "     Used [M]/     Size [M]",
   TO_CHAR(NVL((a.bytes - NVL(f.bytes, 0)) / a.bytes* 100, 0), '990.00') as " Used %"
FROM sys.dba_tablespaces d,
     (select tablespace_name, sum(bytes) bytes from dba_data_files group by tablespace_name) a,
     (select tablespace_name, sum(bytes) bytes from dba_free_space group by tablespace_name) f
WHERE d.tablespace_name = a.tablespace_name(+)
  AND d.tablespace_name = f.tablespace_name(+)
  AND d.tablespace_name like UPPER('%&tbsname%')
  AND NOT (d.extent_management like 'LOCAL' AND d.contents like 'TEMPORARY')
ORDER BY 1,2
/
