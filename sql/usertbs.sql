select distinct owner, tablespace_name from dba_segments
where owner like upper('%&1%')
order by 1,2
/
