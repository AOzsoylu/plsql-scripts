column tbytes format a25 
select    name, to_char(bytes,'fm999G999G999G999G990') as tbytes
from v$sgastat
where pool = 'shared pool'
order by bytes asc
/
column tbytes clear
