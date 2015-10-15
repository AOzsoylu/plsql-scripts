select 'select count(*) from '||tname||';' from tab
where tname like Upper('%&tablename%')
/
