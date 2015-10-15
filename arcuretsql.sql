prompt tarih formatý dd-mm-yyyy hh24:mi þeklinde (25-06-2013 17:00 gibi)
SELECT to_char(begin_interval_time,'YYYY_MM_DD HH24') WHEN
      ,dhss.instance_number INST_ID
      ,rows_processed_delta rows_proc_delta
      ,executions_delta exec_delta
      ,dhss.sql_id
      ,dbms_lob.substr(sql_text,4000,1) SQL
  FROM dba_hist_sqlstat dhss,
       dba_hist_snapshot dhs,
       dba_hist_sqltext dhst
  WHERE upper(dhst.sql_text) LIKE '%&table_name%'
    AND
    ltrim(upper(dhst.sql_text)) NOT LIKE 'SELECT%'
    AND dhss.snap_id=dhs.snap_id
    AND dhss.instance_number=dhs.instance_number
    AND dhss.sql_id=dhst.sql_id
    AND begin_interval_time BETWEEN to_date('&tarih1','DD-MM-YY HH24:MI')
                                AND to_date('&tarih2','DD-MM-YY HH24:MI')
  ORDER BY 3 desc
/
