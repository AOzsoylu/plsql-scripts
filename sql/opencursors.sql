select n.name, s.value from v$statname n, v$sysstat s
where n.statistic# = s.statistic#
  and s.statistic# in (2,3)
/
