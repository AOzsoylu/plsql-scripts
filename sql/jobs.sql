column "SONRAKÝ ZAMAN" format a20
column "PERIYOD" format a50
column "Usr" format a5
select job "ID",
       to_char(next_date,'dd-mm-yyyy hh24:mi:ss') "SONRAKÝ ZAMAN",
       failures,
       broken,
       Substr(schema_user,1,3) "Usr",
       Substr(interval,1,50) "PERIYOD",
       Substr(what,1,200) "NE?"       
 from dba_jobs
order by next_date, job
/
