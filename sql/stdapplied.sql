PROMPT == STDBY ===================================================== STDBY ==
col time format a40
select 'Last applied  : ' Logs, to_char(next_time,'DD-MON-YY:HH24:MI:SS') Time
    from v$archived_log
    where sequence# = (select max(sequence#) from v$archived_log where applied='YES')
    union
    select 'Last received : ' Logs, to_char(next_time,'DD-MON-YY:HH24:MI:SS') Time
    from v$archived_log
   where sequence# = (select max(sequence#) from v$archived_log);
select al.thrd "Thread", almax "Last Seq Received", lhmax "Last Seq Applied"
from (select thread# thrd, max(sequence#) almax
from v$archived_log
where resetlogs_change#=(select resetlogs_change# from v$database)
group by thread#) al,
(select thread# thrd, max(sequence#) lhmax
from v$log_history
where first_time=(select max(first_time) from v$log_history)
group by thread#) lh
where al.thrd = lh.thrd;
PROMPT == STDBY ===================================================== STDBY ==
