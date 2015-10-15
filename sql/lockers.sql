select l1.sid||'.'||l1.inst_id||' is blocking '||l2.sid||'.'||l2.inst_id
  from gv$lock l1, gv$lock l2
where l1.id1 = l2.id1
  and l1.id2 = l2.id2
  and l1.type = l2.type
  and l2.request > 0
  and l1.block > 0
/
