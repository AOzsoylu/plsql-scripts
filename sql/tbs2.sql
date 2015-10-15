SELECT status, tablespace_name, contents, extent_management,
       To_Char(totalsize/1048576,'999G999G990D000') as totalsize,
       To_Char(freesize/1048576,'999G999G990D000') as freesize,
       To_Char(usedsize/1048576,'999G999G990D000') as usedsize,
       To_Char((usedsize/totalsize)*100,'990.00') as tbspercent
FROM (SELECT a.status, a.tablespace_name, a.contents, a.extent_management,
             NVL(sum(b.bytes),0) as totalsize,
             NVL(sum(c.bytes),0) as freesize,
             NVL(sum(b.bytes),0) - NVL(sum(c.bytes),0) as usedsize
        FROM dba_tablespaces a, dba_data_files b, dba_free_space c
        WHERE a.tablespace_name = b.tablespace_name
          AND a.tablespace_name = c.tablespace_name
        GROUP BY a.status, a.tablespace_name, a.contents, a.extent_management
      UNION ALL
      SELECT a.status, a.tablespace_name, a.contents, a.extent_management,
             b.totalsize, b.totalsize-b.usedsize as freesize, b.usedsize
        FROM dba_tablespaces a,
             ( SELECT tablespace_name, NVL(sum(bytes_cached),0) as totalsize, NVL(sum(bytes_used),0) as usedsize FROM v$temp_extent_pool GROUP BY tablespace_name ) b
        WHERE a.tablespace_name = b.tablespace_name)
ORDER BY tablespace_name
/
