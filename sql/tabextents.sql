select Substr(segment_name,1,30) as name, count(*) as sayi, to_char(sum(bytes),'999,999,999,999,999') as bytes
from user_extents
where segment_type ='TABLE'
group by segment_name
order by 1
/
