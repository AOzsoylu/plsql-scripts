select to_char(sum(bytes)/(1024*1024*1024),'fm99990.00')||' GB Dbf' as sonuc from dba_data_files
union all
select to_char((a.sumb-b.sumb),'fm99990.00')||' GB Used' as sonuc
  from (select sum(bytes)/(1024*1024*1024) as sumb from dba_data_files) a,
       (select sum(bytes)/(1024*1024*1024) as sumb from dba_free_space) b
union all
select to_char(sum(bytes*members)/(1024*1024*1024),'fm99990.00')||' GB Redo' as sonuc from v$log
union all
select to_char(sum(bytes)/(1024*1024*1024),'fm99990.00')||' GB Temp' as sonuc from dba_temp_files
/
