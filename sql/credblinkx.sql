SELECT RPAD(u.name,10,' ')||'create '||DECODE(u.name,'PUBLIC','public ',NULL)||
       'database link '||l.name||' connect to '||l.userid||' identified by '||l.password||' using '''||l.host||''';'
FROM sys.link$ l, sys.user$ u
WHERE u.user# = l.owner#
  AND l.name like Upper('&linkname%')
ORDER BY u.name, l.name
/
