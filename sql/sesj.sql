SELECT /*+ RULE */
       p.spid
      ,r.sid
      ,v.serial#
      ,r.job
      ,Substr(j.schema_user,1,12) as USERNAME
      ,r.this_date
      ,r.this_sec
      ,j.failures
      ,j.broken
      ,Substr(j.interval,1,40) as periyod
      ,v.last_call_et "Idle seconds"
      ,Substr(v.program,1,30) "Program"
      ,Substr(j.what,1,200) "Çalýþan Kod?"
FROM dba_jobs_running r, dba_jobs j, v$session v, v$process p
WHERE r.job = j.job
  AND r.sid = v.sid
  AND v.paddr = p.addr(+)
/
