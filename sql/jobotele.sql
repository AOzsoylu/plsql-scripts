select 'exec dbms_ijob.next_date('||job||',xx)',job "ID",
       to_char(next_date,'dd-mm-yyyy hh24:mi:ss') "SONRAKÝ ZAMAN",
       failures,
       broken,
       Substr(schema_user,1,3) "Usr",
       Substr(interval,1,50) "PERIYOD",
       Substr(what,1,200) "NE?"
 from dba_jobs
 where upper(what) like Upper('%'||'&ifade'||'%')
order by next_date, job
/
