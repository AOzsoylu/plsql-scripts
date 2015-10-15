SELECT c.tablespace_name, a.bytes/1048576 Megs_Alloc,
       b.bytes/1048576 Megs_Free,
       (a.bytes-b.bytes)/1048576 Megs_Used,
       b.bytes/a.bytes * 100 Pct_Free,
       (a.bytes-b.bytes)/a.bytes * 100 Pct_Used,
       c.initial_extent/1048576 Init_Ext,
       c.next_extent/1048576 Next_Ext,
       a.minbytes/1048576 Min_Ext,
       a.maxbytes/1048576 Max_Ext
FROM (select tablespace_name, sum(a.bytes) bytes,
             min(a.bytes) minbytes, max(a.bytes) maxbytes
        FROM sys.dba_data_files a group by tablespace_name) a,
     (SELECT a.tablespace_name, nvl(sum(b.bytes),0) bytes
        FROM sys.dba_data_files a, sys.dba_free_space b
        WHERE a.tablespace_name = b.tablespace_name (+)
          AND a.file_id = b.file_id (+)
        GROUP BY a.tablespace_name) b,
      sys.dba_tablespaces c
WHERE a.tablespace_name = b.tablespace_name(+)
  and a.tablespace_name = c.tablespace_name
ORDER BY c.tablespace_name
/
