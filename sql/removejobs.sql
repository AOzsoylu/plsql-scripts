select 'exec dbms_'||decode(USER,'SYS','i',NULL)||'job.remove('||job||')' as removescript from dba_jobs
UNION
select 'exec dbms_'||decode(USER,'SYS','i',NULL)||'job.remove('||job||')' as removescript from user_jobs
/
