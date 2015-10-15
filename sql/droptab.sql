select 'drop '||tabtype||' '||tname||decode(tabtype,'TABLE',' purge',null)||';' from tab
order by tname
/
