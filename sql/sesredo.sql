SELECT
  p.spid unix_pid,
  s.sid,
  s.serial#,
  s.status,
  Substr(s.username,1,15) "Username",
  s.terminal,
  s.osuser,
  s.last_call_et "Idle seconds",
  r.redovalue,
  s.program "Program"
FROM v$process p, v$session s, ( select sid, value as redovalue from
                                  ( select sid, value
                                    from v$sesstat s, v$statname n
                                    where n.statistic# = s.statistic#
                                      and n.name = 'redo size'
                                    order by value desc )
                                where rownum <= 20 ) r
WHERE s.paddr   = p.addr(+)
  and s.sid = r.sid
ORDER BY r.redovalue desc, s.username, s.terminal
/
