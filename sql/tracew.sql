select 'alter system set timed_statistics = true;' as komut from dual
/
select 'execute dbms_system.set_sql_trace_in_session( '||sid||', '||serial#||', '||b.komut1 as komut
from v$session a, ( select ' TRUE);' as komut1 from dual union all select ' FALSE);' as komut1 from dual ) b
where a.status='ACTIVE'
order by b.komut1 desc, a.sid asc
/
