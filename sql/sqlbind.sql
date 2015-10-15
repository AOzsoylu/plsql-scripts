select TO_CHAR(HSS.END_INTERVAL_TIME, 'YYYY-MM-DD HH24:MI:SS')  ,hss.snap_id,sql_bind_capture.name, sql_bind_capture.value_string,DATATYPE_string
   from DBA_HIST_SQLBIND sql_bind_capture,DBA_HIST_SNAPSHOT hss
   where sql_id='&sqlid'
   and sql_bind_capture.SNAP_ID = HSS.SNAP_ID
  order by snap_id desc
/
