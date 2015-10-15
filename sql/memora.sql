select sum(bytes)/1048576 as MB FROM (
select bytes from v$sgastat
union
select value as bytes from v$sesstat s, v$statname n
  where n.statistic#=s.statistic# and n.name = 'session pga memory' )
/
