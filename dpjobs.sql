SELECT owner_name, job_name, operation, job_mode, state, attached_sessions 
FROM dba_datapump_jobs 
ORDER BY 1,2
/