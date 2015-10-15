SELECT 'alter system kill session '''||s.sid||','||s.serial#||''';'
FROM v$session s
WHERE s.username = 'FATURA' and s.terminal is NULL
--SELECT 'alter system kill session '''||r.sid||','||v.serial#||''';'
--FROM dba_jobs_running r, dba_jobs j, v$session v
--WHERE r.job = j.job
--  AND r.sid = v.sid
/
