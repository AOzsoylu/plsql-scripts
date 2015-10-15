select tbsname, fsize, usize, myscr from (
select c.sira,
       a.tablespace_name as tbsname,
       'alter database datafile '''||a.file_name||''''||
       decode(c.sira,1,' resize '||To_Char(trunc(((a.bytes-b.bytes)/1048576)+1),'fm9999999990')||'M;',
                     2,' autoextend on;',NULL) as myscr,
       a.file_name as fname,
       (a.bytes/1048576) as fsize, trunc(((a.bytes-b.bytes)/1048576)+1) as usize
from dba_data_files a, dba_free_space b,
     (select 1 as sira from dual union select 2 as sira from dual) c
where a.tablespace_name like Upper('%&tbsname%')
  and a.file_id = b.file_id )
order by tbsname, fname, sira
/
