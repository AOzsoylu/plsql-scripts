select RPAD(name,36,' ')||value as param from v$parameter
where Upper(name) like Upper('%&1%')
union all
select RPAD(a.ksppinm,36,' ')||b.ksppstvl as param from sys.x$ksppi a,sys.x$ksppcv b
where a.indx = b.indx
  and Upper(a.ksppinm) like Upper('%&1%')
order by 1
/
