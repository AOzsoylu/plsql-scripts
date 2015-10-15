select RPAD(name,36,' ')||value as param from v$parameter
where Upper(name) like Upper('%&1%')
order by name
/
