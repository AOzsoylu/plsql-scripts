SELECT tf.*
  FROM DBA_HIST_SQLTEXT ht,
       table(DBMS_XPLAN.DISPLAY_AWR(ht.sql_id, null, null, 'ALL')) tf
WHERE ht.sql_id='&sqlid'
/
