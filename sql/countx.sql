select 'select count(*) from '||tname||';' from tab
where tabtype in ('TABLE','VIEW','SYNONYM')
  and tname like Upper('%&tabname%')
order by tname
/
