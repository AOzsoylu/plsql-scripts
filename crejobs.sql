set trimspool on
select script from
(
  select 1 as sira, 0 as jobid, 'set serveroutput on' as script from dual
  union all
  select 2 as sira, 0 as jobid, 'declare' as script from dual
  union all
  select 3 as sira, 0 as jobid, '  tnum  binary_integer;' as script from dual
  union all
  select 4 as sira, 0 as jobid, 'begin'  as script from dual
  union all
  select 1 as sira, job as jobid, Instr(what,'''')||'  dbms_job.submit(tnum,'''||what||''', '||
                                                          'to_date('''||to_char(next_date,'dd-mm-yyyy hh24:mi:ss')||''',''DD-MM-YYYY HH24:MI:SS''), '||
                                                          ''''||interval||''',true);' as script from user_jobs
  union all
  select 2 as sira, job as jobid, '  commit;' as script from user_jobs
  union all
  select 2 as sira, job as jobid, '  dbms_output.put_line(tnum);' as script from user_jobs
  union all
  select 1 as sira, 999999999 as jobid, 'end;' as script from dual
  union all
  select 2 as sira, 999999999 as jobid, '/' as script from dual
)
order by jobid, sira
/
