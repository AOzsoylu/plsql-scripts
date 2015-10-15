select owner, table_name from dba_tables where logging  ='NO'
and owner NOT IN ('SYS','SYSTEM','DBSNMP','EXFSYS','WMSYS')
/
