select Substr(i.ksppinm,1,25) as name,
       Substr(i.ksppdesc,1,80) as description,
       Substr(v.ksppstvl,1,30) as value
from x$ksppi i, x$ksppcv v
where i.indx = v.indx
  and i.ksppinm like '/_%flashback%' escape '/'
order by 1
/
