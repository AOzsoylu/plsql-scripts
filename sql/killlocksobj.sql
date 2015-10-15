select 'alter system kill session '''||sid||','||serial#||''';' from v$session
where sid in ( SELECT s.sid from v$process p, v$session s, dba_ddl_locks d
               WHERE s.paddr = p.addr(+)
                 AND s.username is not null
                 AND s.sid = d.session_id
                 AND d.name = Upper('&objname')
                 AND upper(s.osuser) not like '%AOZSOYLU%'
                 AND Substr(upper(s.terminal),1,8) != 'ATILLAOZ' )
/
