select a.ksppinm name, b.ksppstvl value from sys.x$ksppi a,sys.x$ksppcv b
where a.indx = b.indx
  and a.ksppinm like '%&1%'
order by 1
/
