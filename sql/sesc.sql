select * from
( select terminal, osuser, count(*) as sayi
  from v$session group by terminal,osuser
  union
  select 'TOPLAM','>>>>',count(*) from v$session
  order by 3 desc )
where rownum <= 40
/
