select e.sql_text, d.osuser,d.username from v$transaction c, v$session d, v$sqlarea e
where d.taddr = c.addr and e.address = d.prev_sql_addr
and c.xidusn = &ilk
and c.xidslot = &ikinci
and c.xidsqn = &ucuncu
/
