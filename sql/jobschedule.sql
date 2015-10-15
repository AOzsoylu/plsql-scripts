select cizelge as "Job'lar için saat çizelgesi" from
(
select 1 as sira, lpad('Saat',7,' ')||' 0  0  0  0  0  0  0  0  0  0  1  1  1  1  1  1  1  1  1  1  2  2  2  2' as cizelge from dual
union
select 1 as sira, rpad('job#',7,' ')||' 0  1  2  3  4  5  6  7  8  9  0  1  2  3  4  5  6  7  8  9  0  1  2  3        jobid' as cizelge from dual
union
select 3 as sira, lpad('-',7,'-')||lpad('-',85,'-') as cizelge from dual
union
select 4 as sira, rpad(jobid,7,' ')||
                  decode(substr(cizelge, 1,1),'1','[X]','[ ]')||
                  decode(substr(cizelge, 2,1),'1','[X]','[ ]')||
                  decode(substr(cizelge, 3,1),'1','[X]','[ ]')||
                  decode(substr(cizelge, 4,1),'1','[X]','[ ]')||
                  decode(substr(cizelge, 5,1),'1','[X]','[ ]')||
                  decode(substr(cizelge, 6,1),'1','[X]','[ ]')||
                  decode(substr(cizelge, 7,1),'1','[X]','[ ]')||
                  decode(substr(cizelge, 8,1),'1','[X]','[ ]')||
                  decode(substr(cizelge, 9,1),'1','[X]','[ ]')||
                  decode(substr(cizelge,10,1),'1','[X]','[ ]')||
                  decode(substr(cizelge,11,1),'1','[X]','[ ]')||
                  decode(substr(cizelge,12,1),'1','[X]','[ ]')||
                  decode(substr(cizelge,13,1),'1','[X]','[ ]')||
                  decode(substr(cizelge,14,1),'1','[X]','[ ]')||
                  decode(substr(cizelge,15,1),'1','[X]','[ ]')||
                  decode(substr(cizelge,16,1),'1','[X]','[ ]')||
                  decode(substr(cizelge,17,1),'1','[X]','[ ]')||
                  decode(substr(cizelge,18,1),'1','[X]','[ ]')||
                  decode(substr(cizelge,19,1),'1','[X]','[ ]')||
                  decode(substr(cizelge,20,1),'1','[X]','[ ]')||
                  decode(substr(cizelge,21,1),'1','[X]','[ ]')||
                  decode(substr(cizelge,22,1),'1','[X]','[ ]')||
                  decode(substr(cizelge,23,1),'1','[X]','[ ]')||
                  decode(substr(cizelge,24,1),'1','[X]','[ ]')||'        '||job as cizelge
  from jobschedule, dba_jobs
  where Instr(lower(what),'jobcalissin') > 0
    and jobid = substr(what,24,Instr(what,')')-24)
) order by sira
/
