select Substr(decode(segment_type,
                       'TABLE','select count(*) from '||owner||'.'||segment_name||';',
                       segment_type||' -> '||owner||'.'||segment_name)
        ,1,70) as ownscr,
       count(*) as sayi,
       to_char(sum(bytes),'999G999G999G999G999') as bytes
from dba_extents
where tablespace_name like Upper('&tbs'||'%')
group by Substr(decode(segment_type,
                       'TABLE','select count(*) from '||owner||'.'||segment_name||';',
                       segment_type||' -> '||owner||'.'||segment_name)
        ,1,70)
order by 3
/
