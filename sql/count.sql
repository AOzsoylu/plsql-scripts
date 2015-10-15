select 'select count(*) from '||tname||';' from tab
where tabtype in ('TABLE','VIEW','SYNONYM')
order by tname
/
