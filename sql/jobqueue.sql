select name||' = '||value as job_queue_processes from v$parameter where name = 'job_queue_processes'
/
