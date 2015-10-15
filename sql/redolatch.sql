SELECT substr(ln.name, 1, 20),
       gets, misses,
       To_Char((misses/gets)*100,'fm90.000') as ratio,
       immediate_gets, immediate_misses
FROM v$latch l, v$latchname ln
WHERE ln.name in ('redo allocation', 'redo copy')
  and ln.latch# = l.latch#
/
