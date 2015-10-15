set linesize 1000
set pagesize 10000
select to_char(dhss.end_interval_time, 'YYYY-MM-DD HH24:MI:SS')
      ,dhsb.datatype_string
      ,dhsb.name
      ,Substr(dhsb.value_string,1,300) as value_string
from dba_hist_sqlbind dhsb,
     dba_hist_snapshot dhss
where dhsb.sql_id='&xsql_id'
  and dhsb.snap_id= &xsnap_id
  and dhsb.snap_id = dhss.snap_id
order by 1 desc
/
