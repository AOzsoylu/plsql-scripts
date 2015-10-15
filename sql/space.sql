col owner format a15
--col comments format a30
col name format a35
set linesize 1000
set trimspool on
--SELECT OWNER,JOB_NAME,ENABLED,COMMENTS FROM DBA_SCHEDULER_JOBS;
--
--AUTO_SPACE_ADVISOR_JOB  job ı enable durumda 
--
select To_Char((x.wasted/x.mbs)*100,'990G00') as oran, x.* from (
SELECT a.owner,
       a.segment_name name,
       a.segment_type,
       ROUND (a.bytes / 1024 / 1024, 0) MBS,
       ROUND ( (a.bytes - (b.num_rows * b.avg_row_len)) / 1024 / 1024, 0) WASTED
    FROM dba_segments a, dba_tables b
   WHERE     a.owner = b.owner
         AND a.owner NOT LIKE 'SYS%'
         AND a.segment_name = b.table_name
         AND a.segment_type in ( 'TABLE','INDEX')
GROUP BY a.owner,
         a.segment_name,
         a.segment_type,
         ROUND (a.bytes / 1024 / 1024, 0),
         ROUND ( (a.bytes - (b.num_rows * b.avg_row_len)) / 1024 / 1024, 0)
  HAVING ROUND (bytes / 1024 / 1024, 0) > 100) x
order by 2,1 desc
/
